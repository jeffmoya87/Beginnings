import React from "react";
import { useNavigate } from "react-router-dom";

function FriendChild(props) {
  const navigate = useNavigate();

  const friend = props.aFriend;
  // const friendSkill = props.friends;

  const onLocalRemoveClicked = (e) => {
    // debugger;
    e.preventDefault();
    props.onRemoveClicked(friend, e);
  };

  const onLocalEditClicked = (e) => {
    e.preventDefault();
    // console.log(e.currentTarget);
    // const friendId = e.currentTarget.dataset.page;
    navigateToFriendPage(friend);
  };

  const navigateToFriendPage = (friendInfo) => {
    const state = { type: "FRIEND_INFO", payload: friendInfo };

    navigate(`${friend.id}`, { state });
  };

  return (
    <div className="col-md-4 pb-2">
      <div className="card" style={{ maxWidth: 286 }}>
        <img
          src={friend.url}
          className="card-img-top"
          alt=" I Love Code"
          style={{ maxWidth: 286, height: 180 }}
        />
        <div className="card-body">
          <h3 className="card-title center-text">{friend.title}</h3>
          <h5 className="card-text mx-auto" style={{ maxHeight: 100 }}>
            Headline: {friend.headline}
          </h5>
          <p className="card-text mx-auto" style={{ maxHeight: 100 }}>
            Bio: {friend.bio}
          </p>
          {/* <p className="card-text mx-auto" style={{ maxHeight: 100 }}>
            Skills: {friendSkill.name || friend.slug}
          </p> */}
          <div className="row">
            <button
              type="button"
              data-page={`${friend.id}`}
              className="link-btn btn btn-warning mx-auto"
              onClick={onLocalEditClicked}
              style={{ width: 100 }}
            >
              Edit Friend
            </button>
            <button
              type="button"
              className="link-btn btn btn-danger mx-auto"
              onClick={onLocalRemoveClicked}
              style={{ width: 100 }}
            >
              Remove Friend
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default React.memo(FriendChild);
