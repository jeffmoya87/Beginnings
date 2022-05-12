import React, { useEffect, useState, useCallback } from "react";
import friendsServices from "../../services/friendService";
import FriendChild from "./FriendsChild";
import { Link } from "react-router-dom";
import "rc-pagination/assets/index.css";
import locale from "rc-pagination/lib/locale/en_US";
import Pagination from "rc-pagination";

function Friends() {
  const [pageData, setPageData] = useState({
    friendsArr: [],
    friendsComponents: [],
    pageIndex: 0,
    pageSize: 6,
    total: 0,
    current: 1,
    totalCount: 0,
    q: "",
  });

  const [contentRender, setContentRender] = useState(true);

  useEffect(() => {
    onGetFriends(pageData.pageIndex, pageData.pageSize);
  }, []);

  const onSearchFieldChange = (e) => {
    const target = e.target;
    const newFriendValue = target.value;
    const nameOfField = target.name;

    setPageData((prevState) => {
      const newSearchObject = {
        ...prevState,
      };
      newSearchObject[nameOfField] = newFriendValue;
      return newSearchObject;
    });
  };

  const onClickSearch = (e) => {
    e.preventDefault();
    friendsServices
      .searchFriends(pageData.pageIndex, pageData.pageSize, pageData.q)
      .then(onGetFriendsSuccess)
      .catch(onSearchFail);
  };

  const onGetFriends = (pageIndex, pageSize) => {
    friendsServices
      .getFriends(pageIndex, pageSize)
      .then(onGetFriendsSuccess)
      .catch(onGetFriendsFail);
  };

  const onGetFriendsSuccess = (response) => {
    console.log(response);
    const newFriendsArr = response.data.item.pagedItems;
    // const newNewArr = newFriendsArr.map((potato) => {
    //   return potato.skills;
    // });
    const pagination = response.data.item;
    setPageData((prevState) => {
      const pd = { ...prevState };
      pd.current = pagination.pageIndex + 1;
      pd.pageIndex = pagination.pageIndex;
      pd.totalCount = response.data.item.totalCount;
      // pd.friendsArr = newNewArr.map(mapFriends);
      pd.friendsArr = newFriendsArr;
      pd.friendsComponents = newFriendsArr.map(mapFriend);
      return pd;
    });
  };

  // const mapFriends = (newFriend) => {
  //   //console.log("mapping", friend);
  //   return <FriendChild friends={newFriend} />;
  // };

  const mapFriend = (friend) => {
    //console.log("mapping", friend);
    return (
      <FriendChild
        onRemoveClicked={onDeleteRequested}
        aFriend={friend}
        key={friend.title}
      />
    );
  };

  const onDeleteRequested = useCallback((myFriend, eObj) => {
    console.log(myFriend.id, { myFriend, eObj });

    const handler = getDeleteSuccessHandler(myFriend.id);

    friendsServices
      .deleteFriend(myFriend.id)
      .then(handler)
      .catch(onDeleteFriendFail);
  }, []);

  const getDeleteSuccessHandler = (idToBeDeleted) => {
    console.log("getDeleteSuccessHandler", idToBeDeleted);
    return () => {
      console.log("onDeleteSuccess", idToBeDeleted);
      setPageData((prevState) => {
        const pd = { ...prevState };
        pd.friendsArr = [...pd.friendsArr];

        const idxOf = pd.friendsArr.findIndex((friend) => {
          let result = false;

          if (friend.id === idToBeDeleted) {
            result = true;
          }

          return result;
        });

        if (idxOf >= 0) {
          pd.friendsArr.splice(idxOf, 1);
          pd.friendsComponents = pd.friendsArr.map(mapFriend);
        }

        return pd;
      });
    };
  };

  const onPageChange = (page) => {
    console.log(page);
    // axios call
    onGetFriends(page - 1, pageData.pageSize);
  };

  // const onDeleteFriendSuccess = (idToBeDeleted) => {
  //   console.log("onDeleteSuccess", idToBeDeleted);
  //   setPageData((prevState) => {
  //     const pd = { ...prevState };
  //     pd.friendsArr = [...pd.friendsArr];

  //     const idxOf = pd.friendsArr.findIndex((friend) => {
  //       let result = false;

  //       if (friend.id === idToBeDeleted) {
  //         result = true;
  //       }

  //       return result;
  //     });

  //     if (idxOf >= 0) {
  //       pd.friendsArr.splice(idxOf, 1);
  //       pd.friendsComponents = pd.friendsArr.map(mapFriend);
  //     }

  //     return pd;
  //   });
  // };

  // const onSearchSucces = (response) => {
  //   console.log("search ok", response);
  // };

  const onSearchFail = (err) => {
    console.error("search fail", err);
  };

  const onGetFriendsFail = (err) => {
    console.error("getFriends err", err);
  };

  const onDeleteFriendFail = (err) => {
    console.error("deleteFriend err", err);
  };

  const onClickToggleContent = () => {
    setContentRender((prevState) => !prevState);
  };

  return (
    <React.Fragment>
      <div className="container">
        <h1 className="text-center">Friends</h1>
        <h3 className="text-center">
          {" "}
          <Pagination
            onChange={onPageChange}
            defaultCurrent={pageData.current}
            total={pageData.totalCount}
            pageSize={pageData.pageSize}
            locale={locale}
          />
        </h3>
      </div>
      <div className="container">
        <form>
          <div className="row justify-content-center">
            <div className="mb-3 col-6 col-sm-3">
              <label className="form-label">Find Friend:</label>
              <input
                name="q"
                value={pageData.q}
                type="text"
                className="form-control"
                aria-describedby="emailHelp"
                onChange={onSearchFieldChange}
              ></input>
            </div>
          </div>
          <div className="row justify-content-center">
            <button
              onClick={onClickSearch}
              type="submit"
              className="btn btn-primary col-4 col-sm-3"
            >
              Search
            </button>
          </div>
        </form>

        <div className="row justify-content-between">
          <Link
            to="/friends/new"
            type="button"
            className="btn btn-success col-md-3 pb-2"
          >
            Add Friend
          </Link>
          <button
            onClick={onClickToggleContent}
            type="button"
            className="btn btn-secondary col-md-3 pb-2"
          >
            Toggle Content
          </button>
        </div>
      </div>

      {contentRender && (
        <div className="friend-container">
          <div className="row">{pageData.friendsArr.map(mapFriend)}</div>
          {/* <div className="row">{pageData.friendsComponents}</div> */}
        </div>
      )}
    </React.Fragment>
  );
}

export default Friends;
