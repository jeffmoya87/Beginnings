import axios from "axios";

const endpoint = "secret";

const logIn = (payload) => {
  const config = {
    method: "POST",
    url: `${endpoint}/login`,
    data: payload,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };
  return axios(config);
};

const logout = () => {
  const config = {
    method: "GET",
    url: `${endpoint}/logout`,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };
  return axios(config);
};

const getCurrentUser = () => {
  const config = {
    method: "GET",
    url: `${endpoint}/current`,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };
  return axios(config);
};

const getUserById = (payload) => {
  const config = {
    method: "GET",
    url: `${endpoint}/${payload}`,
    data: payload,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };
  return axios(config);
};

const register = (payload) => {
  const config = {
    method: "POST",
    url: `${endpoint}/register`,
    data: payload,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };
  return axios(config);
};

const userServices = { logIn, register, getCurrentUser, getUserById, logout };

export default userServices;
