import React, { useState } from "react";
import userServices from "../../services/userService";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
toast.configure();

function Register(props) {
  const [newUser, setNewUser] = useState(props.defaultUser);

  const onFormFieldChange = (e) => {
    //console.log("onChange", { syntheticEvent: e });

    const target = e.target;

    const newUserValue = target.value;
    const nameOfField = target.name;

    //console.log({ nameOfField, newUserValue });

    setNewUser((prevState) => {
      //console.log("updater onChange");

      const newUserObject = {
        ...prevState,
      };

      newUserObject[nameOfField] = newUserValue;

      return newUserObject;
    });
    //console.log("end onChnage");
  };

  const onClickRegister = (e) => {
    e.preventDefault();
    userServices
      .register(newUser)
      .then(onRegisterSuccess)
      .catch(onRegisterFail);
  };

  const onRegisterSuccess = (response) => {
    console.log("register ok", response);
    toast.success("Registration Successful!");
  };
  const onRegisterFail = (err) => {
    console.log("register err", err);
    toast.error("Bummer, you failed. Please try again");
  };

  return (
    <React.Fragment>
      <h1>Register</h1>
      <div className="container">
        <form>
          <div className="mb-3 col-6 col-sm-3">
            <label id="fName" className="form-label">
              First Name
            </label>
            <input
              name="firstName"
              type="text"
              className="form-control"
              id="fName"
              aria-describedby="emailHelp"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label id="lName" className="form-label">
              Last Name
            </label>
            <input
              name="lastName"
              type="text"
              className="form-control"
              id="lName"
              aria-describedby="emailHelp"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label id="email" className="form-label">
              Email
            </label>
            <input
              name="email"
              type="email"
              className="form-control"
              id="email"
              aria-describedby="emailHelp"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label id="password1" className="form-label">
              Password
            </label>
            <input
              name="password"
              type="password"
              className="form-control"
              id="password"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label id="password2" className="form-label">
              Confirm Password
            </label>
            <input
              name="passwordConfirm"
              type="password"
              className="form-control"
              id="password2"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label id="avatar" className="form-label">
              Profile Url
            </label>
            <input
              name="avatarUrl"
              type="email"
              className="form-control"
              id="avatar"
              aria-describedby="emailHelp"
              onChange={onFormFieldChange}
            ></input>
          </div>

          <button
            onClick={onClickRegister}
            type="submit"
            className="btn btn-primary col-4 col-sm-3"
          >
            Register
          </button>
        </form>
      </div>
    </React.Fragment>
  );
}

export default Register;
