import React, { useState, useEffect } from "react";
import "./App.css";
import SiteNav from "./components/SiteNav";
import Footer from "./components/Footer";
import { Routes, Route } from "react-router-dom";
import Home from "./components/Home";
import TestAndAjax from "./components/TestAndAjax";
import Events from "./components/events/Events";
import Friends from "./components/friends/Friends";
import Jobs from "./components/jobs/Jobs";
import Companies from "./components/techcompanies/Companies";
import Login from "./components/user/Login";
import Register from "./components/user/Register";
import Products from "./components/codeChallenge/Products";
import AddFriend from "./components/friends/AddFriend";
import userServices from "./services/userService";
import Cars from "./components/codeChallenge/Cars";
import debug from "sabio-debug";

const _logger = debug.extend("App"); //sabio:App
const _loggerPage = _logger.extend("SPA"); //sabio:App:SPA

function App() {
  _loggerPage("Full Application/Page Refresh Detected");
  _logger("App Page");

  const [defaultUser, setDefaultUser] = useState({
    firstName: "Unknown",
    lastName: "User",
    email: "",
    id: "",
    isConfirmed: false,
    avatarUrl: "",
    tenantId: "U02T81PLMLJ",
  });
  //console.log(currentUser);

  useEffect(() => {
    getUser();
  }, []);

  const getUser = () => {
    userServices.getCurrentUser().then(onGetUserSuccess).catch(onGetUserFail);
  };

  const getUserInfo = (id) => {
    userServices.getUserById(id).then(onGetByIdSuccess).catch(onGetByIdFail);
  };

  const onGetUserSuccess = (response) => {
    const userInfo = response.data.item.id;
    getUserInfo(userInfo);
  };

  const onGetByIdSuccess = (response) => {
    //console.log("getById good", response);
    const currentUserInfo = response.data.item;
    setDefaultUser((prevState) => {
      const affixUserInfo = { ...prevState, ...currentUserInfo };
      return affixUserInfo;
    });
  };

  const onGetByIdFail = (err) => {
    console.error("getById bad", err);
  };

  const onGetUserFail = (err) => {
    console.error("getUser mal", err);
  };

  return (
    <React.Fragment>
      <SiteNav currentUser={defaultUser} setCurrentUser={setDefaultUser} />

      <Routes>
        <Route path="/" element={<Home defaultUser={defaultUser} />}></Route>
        <Route path="/cars" element={<Cars />}></Route>
        <Route path="/testandajax" element={<TestAndAjax />}></Route>
        <Route path="/events" element={<Events />}></Route>
        <Route path="/friends" element={<Friends />}></Route>
        <Route path="/jobs" element={<Jobs />}></Route>
        <Route path="/companies" element={<Companies />}></Route>
        <Route
          path="/login"
          element={
            <Login currentUser={defaultUser} setCurrentUser={setDefaultUser} />
          }
        ></Route>
        <Route
          path="/register"
          element={<Register defaultUser={defaultUser} />}
        ></Route>
        <Route path="/products" element={<Products />}></Route>

        <Route path="/friends/new" element={<AddFriend />}></Route>
        <Route path="/friends/:friendId" element={<AddFriend />}></Route>
      </Routes>
      <Footer />
    </React.Fragment>
  );
}

export default App;
