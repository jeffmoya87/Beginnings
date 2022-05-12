import React from "react";

function CarsChild(props) {
  const newCar = props.aCar;

  return (
    <React.Fragment>
      <div className="card col-md-3 m-1">
        <div className="card-body">
          <h5 className="card-title">{newCar.make}</h5>
          <h5 className="card-text">{newCar.model}</h5>
          <h5 className="card-text">{newCar.year}</h5>
        </div>
      </div>
    </React.Fragment>
  );
}

export default CarsChild;
