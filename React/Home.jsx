import React from "react";
import PropTypes from "prop-types";

function Home(props) {
  //console.log("Home ->", props);
  const cUser = {
    ...props.defaultUser,
  };
  return (
    <React.Fragment>
      <h1>
        Hello {props.defaultUser.firstName} {cUser.lastName}
        {props.defaultUser.id}
      </h1>

      <hr />
    </React.Fragment>
  );
}
// "template.html": true,
//     ".github": true,
//     ".vs": true,
//     ".vscode": true
Home.propTypes = {
  // user: PropTypes.object.isRequired,
  defaultUser: PropTypes.shape({
    id: PropTypes.number.isRequired,
    firstName: PropTypes.number.isRequired,
    lastName: PropTypes.string.isRequired,
  }),
};

export default Home;
