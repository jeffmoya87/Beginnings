import axios from "axios";

const endpoint = "secret";;

const getFriends = (pageIndex, pageSize) => {
  const config = {
    method: "GET",
    url: endpoint + `?pageIndex=${pageIndex}&pageSize=${pageSize}`,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };

  return axios(config);
};

const searchFriends = (pageIndex, pageSize, querry) => {
  const config = {
    method: "GET",
    url:
      endpoint +
      `search?pageIndex=${pageIndex}&pageSize=${pageSize}&query=${querry}`,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };

  return axios(config);
};

const deleteFriend = (id) => {
  const config = {
    method: "GET",
    url: endpoint + id,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };
  console.log("in the middle");
  return axios(config);
};

const addFriend = (payload) => {
  const config = {
    method: "POST",
    url: endpoint,
    data: payload,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };

  return axios(config);
};

const updateFriend = (payload) => {
  const config = {
    method: "PUT",
    url: endpoint + payload.newFriendId,
    data: payload,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };

  return axios(config);
};

const getFriendById = (payload) => {
  const config = {
    method: "GET",
    url: endpoint + payload,
    data: payload,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };

  return axios(config);
};

const friendsServices = {
  getFriends,
  deleteFriend,
  addFriend,
  updateFriend,
  getFriendById,
  searchFriends,
};

export default friendsServices;
