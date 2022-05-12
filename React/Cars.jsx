import React, { useState } from "react";
import CarsChild from "./CarsChild";

function Cars() {
  //I added an attribute in order to give each item a unique key.
  //It was the only way I could get the warnings to stop popping up

  const [carsArr, setCarsArr] = useState([
    {
      make: "Kia",
      model: "Sorento",
      year: 2020,
      key: "a",
    },
    {
      make: "Kia",
      model: "Optima",
      year: 2019,
      key: "b",
    },
    {
      make: "Tesla",
      model: "Model 3",
      year: 2021,
      key: "c",
    },
    {
      make: "Honda",
      model: "Civic",
      year: 2019,
      key: "d",
    },
    {
      make: "Honda",
      model: "Accord",
      year: 2018,
      key: "e",
    },
    {
      make: "Volkswagen",
      model: "Jetta",
      year: 2021,
      key: "f",
    },
    {
      make: "Toyota",
      model: "Camry",
      year: 2021,
      key: "g",
    },
    {
      make: "Ford",
      model: "Mustang",
      year: 2019,
      key: "h",
    },
    {
      make: "Ford",
      model: "F-150",
      year: 2019,
      key: "i",
    },
    {
      make: "Toyota",
      model: "Camry",
      year: 2020,
      key: "j",
    },
    {
      make: "Ford",
      model: "F-150",
      year: 2021,
      key: "k",
    },
  ]);

  const [contentRender, setContentRender] = useState(true);

  const mapCars = (car) => {
    return <CarsChild aCar={car} key={car.key} />;
  };

  const mappedCars = carsArr.map(mapCars);

  const onClickToggleContent = () => {
    setContentRender((prevState) => !prevState);
  };

  //all these click handlers do not work
  //I get the correct arrays after filtering but cannot render them on the page
  //I get nothing but a slew of errors when the buttons in the dropdown are clicked

  const get2019Cars = (cars) => {
    const filterCars = (carObj) => {
      let result = false;
      if (carObj.year === 2019) {
        result = true;
      }
      return result;
    };
    const filtered2019 = cars.filter(filterCars);
    console.log(filtered2019);
    setCarsArr((prevState) => {
      const newState = { ...prevState, filtered2019 };
      console.log(newState);
      return newState;
    });
  };

  const onClick2019 = () => {
    get2019Cars(carsArr);
  };

  const get2020Cars = (cars) => {
    const filterCars = (carObj) => {
      let result = false;
      if (carObj.year === 2020) {
        result = true;
      }
      return result;
    };
    const filtered2020 = cars.filter(filterCars);
    console.log(filtered2020);
    setCarsArr((prevState) => {
      const newState = { ...prevState, filtered2020 };
      console.log(newState);
      return newState;
    });
  };

  const onClick2020 = () => {
    get2020Cars(carsArr);
  };

  const get2021Cars = (cars) => {
    const filterCars = (carObj) => {
      let result = false;
      if (carObj.year === 2021) {
        result = true;
      }
      return result;
    };
    const filtered2021 = cars.filter(filterCars);
    console.log(filtered2021);
    setCarsArr((prevState) => {
      const newState = { ...prevState, filtered2021 };
      console.log(newState);
      return newState;
    });
  };

  const onClick2021 = () => {
    get2021Cars(carsArr);
  };

  // const onClickDisplay2019 = (e) => {
  //   e.preventDefault();
  //   setDisplayCars(() => {
  //     return true;
  //   });
  //   let carsData = cars.carsArray.filter((car) => {
  //     if (car.year === 2019) {
  //       return true;
  //     }
  //     return carsData;
  //   });
  //   mapCarsAfterFilter(carsData);
  // };

  // const mapCarsAfterFilter = (data) => {
  //   setCars((prevState) => {
  //     let mappedCars = { ...prevState };
  //     mappedCars.carsArrayDisplay = data.map(mappingCars);
  //     return mappedCars;
  //   });
  // };

  return (
    <React.Fragment>
      <h1>Cars</h1>;
      <div className="row justify-content-between">
        <button
          onClick={onClickToggleContent}
          type="button"
          className="btn btn-primary col-md-3 pb-2"
        >
          Show Cars
        </button>
        <div className="dropdown">
          <button
            type="button"
            className="btn btn-success dropdown-toggle col-md-3 pb-2"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            Select Year
          </button>
          <ul className="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <li>
              <button
                onClick={onClick2019}
                className="dropdown-item"
                type="button"
              >
                2019
              </button>
            </li>
            <li>
              <button
                onClick={onClick2020}
                className="dropdown-item"
                type="button"
              >
                2020
              </button>
            </li>
            <li>
              <button
                onClick={onClick2021}
                className="dropdown-item"
                type="button"
              >
                2021
              </button>
            </li>
          </ul>
        </div>
      </div>
      {contentRender && (
        <div className="cars-container">
          <div className="row">{mappedCars}</div>
        </div>
      )}
    </React.Fragment>
  );
}

export default Cars;
