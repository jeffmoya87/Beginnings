import React, { useState, useEffect } from "react";
import friendsServices from "../../services/friendService";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { useLocation } from "react-router-dom";

toast.configure();

function AddFriend() {
  const { state } = useLocation();
  console.log("LOCATION", state);

  // const { friendId } = useParams();
  const [formData, setFormData] = useState({
    title: "",
    bio: "",
    summary: "",
    headline: "",
    slug: "",
    primaryImage: "",
    statusId: "active",
  });

  useEffect(() => {
    if (state?.type === "FRIEND_INFO" && state?.payload) {
      setFormData((prevState) => {
        return { ...prevState, ...state.payload };
      });
    }
  }, [state]);

  // useEffect(() => {
  //   if (friendId) {
  //     friendsServices
  //       .getFriendById(friendId)
  //       .then(getFriendSuccess)
  //       .catch(getFriendFail);
  //   }
  // }, []);

  // console.log(friendId);
  const onFormFieldChange = (e) => {
    const target = e.target;
    const newFriendValue = target.value;
    const nameOfField = target.name;

    setFormData((prevState) => {
      const newFriendObject = {
        ...prevState,
      };
      newFriendObject[nameOfField] = newFriendValue;
      return newFriendObject;
    });
  };

  const onClickAdd = (e) => {
    e.preventDefault();
    if (formData.newFriendId) {
      friendsServices
        .updateFriend(formData)
        .then(onUpdateSuccess)
        .catch(onUpdateFail);
    } else {
      friendsServices.addFriend(formData).then(onAddSuccess).catch(onAddFail);
    }
  };

  const onUpdateSuccess = (response) => {
    console.log("update ok", response);
    toast.success("Update Successful!");
  };

  const onUpdateFail = (err) => {
    console.error("update fail", err);
    toast.error("Update fail. Try again.");
  };

  const onAddSuccess = (response) => {
    console.log("addFriend ok", response);
    toast.success("Added Friend Successfully!");
    setFormData((prevState) => {
      const newFriendId = response.data.item;
      const addId = { ...prevState, newFriendId };
      console.log(addId);
      return addId;
    });
  };

  // const getFriendSuccess = (response) => {
  //   console.log("getFriend ok", response.data.item);
  //   setFormData((prevState) => {
  //     const cardInfo = response.data.item;

  //     // prevState.title = cardInfo.title;
  //     // prevState.bio = cardInfo.bio;
  //     // prevState.summary = cardInfo.summary;
  //     // prevState.headline = cardInfo.headline;
  //     // prevState.slug = cardInfo.slug;
  //     // prevState.primaryImage = cardInfo.primaryImage.imageUrl;
  //     return { ...prevState, ...cardInfo };
  //   });
  // };

  const onAddFail = (err) => {
    console.error("add bad", err);
    toast.error("Bummer, add fail. Try again.");
  };

  // const getFriendFail = (err) => {
  //   console.error("getFriend fail", err);
  // };

  return (
    <React.Fragment>
      <h1>Add Friend</h1>
      <div className="container">
        <form>
          <div className="mb-3 col-6 col-sm-3">
            <label className="form-label">Title</label>
            <input
              name="title"
              value={formData.title}
              type="text"
              className="form-control"
              aria-describedby="emailHelp"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label className="form-label">Bio</label>
            <input
              name="bio"
              value={formData.bio}
              type="text"
              className="form-control"
              aria-describedby="emailHelp"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label className="form-label">Summary</label>
            <input
              name="summary"
              value={formData.summary}
              type="text"
              className="form-control"
              aria-describedby="emailHelp"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label className="form-label">Headline</label>
            <input
              name="headline"
              value={formData.headline}
              type="text"
              className="form-control"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label className="form-label">Slug</label>
            <input
              name="slug"
              value={formData.slug}
              type="text"
              className="form-control"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label id="avatar" className="form-label">
              Pic
            </label>
            <input
              name="primaryImage"
              value={formData.primaryImage.imageUrl}
              type="src"
              className="form-control"
              aria-describedby="emailHelp"
              onChange={onFormFieldChange}
            ></input>
          </div>

          <button
            onClick={onClickAdd}
            type="submit"
            className="btn btn-primary col-4 col-sm-3"
          >
            Add/Edit
          </button>
        </form>
      </div>
    </React.Fragment>
  );
}

export default AddFriend;
