import React, { useState } from "react";
import addProducts from "./services/productsServices";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
toast.configure();

function Products() {
  const [products, setProducts] = useState({});

  const onFormFieldChange = (e) => {
    const target = e.target;

    const newValue = target.value;
    const nameOfField = target.name;

    setProducts((prevState) => {
      const newObject = {
        ...prevState,
      };

      newObject[nameOfField] = newValue;

      return newObject;
    });
  };

  const onClickAdd = (e) => {
    e.preventDefault();
    addProducts(products).then(onAddSuccess).catch(onAddFail);
  };

  const onAddSuccess = (response) => {
    toast.success(`Success! Entity was created. ID: ${response.data.item}`);
  };

  const onAddFail = (err) => {
    console.error("add not ok", err);
    toast.error("Creation failed");
  };

  return (
    <React.Fragment>
      <h1>Add Product</h1>
      <div className="container">
        <form>
          <div className="mb-3 col-6 col-sm-3">
            <label className="form-label">Name</label>
            <input
              name="entityName"
              type="text"
              className="form-control"
              aria-describedby="emailHelp"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label className="form-label">Manufacturer</label>
            <input
              name="manufacturer"
              type="text"
              className="form-control"
              aria-describedby="emailHelp"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label className="form-label">Description</label>
            <input
              name="description"
              type="text"
              className="form-control"
              aria-describedby="emailHelp"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <div className="mb-3 col-6 col-sm-3">
            <label className="form-label">Cost</label>
            <input
              name="cost"
              type="number"
              className="form-control"
              onChange={onFormFieldChange}
            ></input>
          </div>
          <button
            onClick={onClickAdd}
            type="submit"
            className="btn btn-primary col-4 col-sm-3"
          >
            Add
          </button>
        </form>
      </div>
    </React.Fragment>
  );
}

export default Products;
