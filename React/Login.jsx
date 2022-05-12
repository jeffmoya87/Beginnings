import React from "react";
import userServices from "../../services/userService";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
toast.configure();

function Login(props) {
  const user = props.currentUser;
  const setUser = props.setCurrentUser;

  const onFormFieldChange = (e) => {
    const target = e.target;

    const newUserValue = target.value;
    const nameOfField = target.name;

    setUser((prevState) => {
      const newUserObject = {
        ...prevState,
      };

      newUserObject[nameOfField] = newUserValue;

      return newUserObject;
    });
  };

  const onClickLogin = (e) => {
    e.preventDefault();
    userServices.logIn(user).then(onLoginSuccess).catch(onLoginError);
  };

  const onLoginSuccess = (response) => {
    userServices.getCurrentUser().then(onGetUserSuccess).catch(onGetUserFail);
    console.log("login ok", response);
    toast.success("Login Successful! Welcome back!");
  };

  const onGetUserSuccess = (response) => {
    userServices
      .getUserById(response.data.item.id)
      .then(onGetByIdSuccess)
      .catch(onGetByIdFail);
    console.log(response.data.item.id);
  };

  const onGetByIdSuccess = (response) => {
    console.log("By Id ok", response);
    const loggedInUser = response.data.item;
    setUser((prevState) => {
      const newUser = { ...prevState, ...loggedInUser };
      return newUser;
    });
  };

  const onGetByIdFail = (err) => {
    console.error("By Id fail", err);
  };

  const onGetUserFail = (err) => {
    console.error("getUser bad", err);
  };

  const onLoginError = (err) => {
    console.log("login fail", err);
    toast.error("Login failed. Did you forget your password?");
  };

  return (
    <React.Fragment>
      <h1>Login</h1>
      <div className="container">
        <form>
          <div className="mb-3 col-6 col-sm-3">
            <label id="exampleInputEmail1" className="form-label">
              Email address
            </label>
            <input
              name="email"
              type="email"
              className="form-control"
              id="exampleInputEmail1"
              aria-describedby="emailHelp"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label id="exampleInputPassword1" className="form-label">
              Password
            </label>
            <input
              name="password"
              type="password"
              className="form-control"
              id="exampleInputPassword1"
              onChange={onFormFieldChange}
            ></input>
          </div>

          {props.currentUser.isConfirmed === false && (
            <button
              onClick={onClickLogin}
              type="submit"
              className="btn btn-primary col-4 col-sm-3"
            >
              Login
            </button>
          )}
        </form>
      </div>
    </React.Fragment>
  );
}

export default Login;
