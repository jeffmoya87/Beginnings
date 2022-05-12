import React from "react";
import { Link } from "react-router-dom";
import userServices from "../services/userService";
import { useNavigate } from "react-router-dom";

function SiteNav(props) {
  const newUser = props.currentUser;
  const returnDefaultUser = props.setCurrentUser;

  const onLogoutClicked = (e) => {
    e.preventDefault();
    userServices.logout().then(onLogoutSuccess).catch(onLogoutFail);
  };

  const navigate = useNavigate();

  const onLogoutSuccess = (response) => {
    console.log("logout ok", response);
    returnDefaultUser((prevState) => {
      const afterLogout = {
        firstName: "Unknown",
        lastName: "User",
        email: "",
        id: "",
        isConfirmed: false,
        password: "",
        avatarUrl: "",
      };
      const newDefault = { ...prevState, ...afterLogout };
      return newDefault;
    });
    navigate("/");
  };

  const onLogoutFail = (err) => {
    console.error("logout fail", err);
  };

  return (
    <React.Fragment>
      <nav
        className="navbar navbar-expand-md navbar-dark bg-dark"
        aria-label="Fourth navbar example"
      >
        <div className="container">
          <a className="navbar-brand" href="/">
            <img
              src="https://pw.sabio.la/images/Sabio.png"
              width="30"
              height="30"
              className="d-inline-block align-top"
              alt="Sabio"
            />
          </a>
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarsExample04"
            aria-controls="navbarsExample04"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>

          <div className="collapse navbar-collapse" id="navbarsExample04">
            <ul className="navbar-nav me-auto mb-2 mb-md-0">
              <li className="nav-item">
                <Link to="/" className="nav-link px-2 text-white link-button">
                  Home
                </Link>
              </li>
              <li className="nav-item">
                <Link
                  to="/cars"
                  className="nav-link px-2 text-white link-button"
                >
                  Cars
                </Link>
              </li>
              <li className="nav-item">
                <Link
                  to="/products"
                  className="nav-link px-2 text-white link-button"
                >
                  Products
                </Link>
              </li>
              <li className="nav-item">
                <Link
                  to="/friends"
                  className="nav-link px-2 text-white link-button"
                >
                  Friends
                </Link>
              </li>
              <li className="nav-item">
                <Link
                  to="/jobs"
                  className="nav-link px-2 text-white link-button"
                >
                  Jobs
                </Link>
              </li>
              <li className="nav-item">
                <Link
                  to="/companies"
                  className="nav-link px-2 text-white link-button"
                >
                  Tech Companies
                </Link>
              </li>
              <li className="nav-item">
                <Link
                  to="/events"
                  className="nav-link px-2 text-white link-button"
                >
                  Events
                </Link>
              </li>
              <li className="nav-item">
                <Link
                  to="/testandajax"
                  className="nav-link px-2 text-white link-button"
                >
                  Test and Ajax Call
                </Link>
              </li>
            </ul>
            <div className="text-end">
              <Link
                to="/"
                className="align-items-center mb-2 me-2 mb-lg-0 text-white text-decoration-none"
              >
                {newUser.firstName} {newUser.lastName}
              </Link>
              {newUser.isConfirmed === false && (
                <Link
                  to="/login"
                  type="button"
                  className="btn btn-outline-light me-2"
                >
                  Login
                </Link>
              )}
              {newUser.isConfirmed === true && (
                <Link
                  to="/"
                  onClick={onLogoutClicked}
                  type="submit"
                  className="btn btn-outline-light me-2"
                >
                  Logout
                </Link>
              )}
              <Link to="/register" type="button" className="btn btn-warning">
                Register
              </Link>
            </div>
          </div>
        </div>
      </nav>
    </React.Fragment>
  );
}

export default SiteNav;
