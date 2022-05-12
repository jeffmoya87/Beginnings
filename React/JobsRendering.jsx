import React from "react";

function JobsRendering(props) {
  const jobPost = props.aJob;

  return (
    <div className="col-md-3 pb-2">
      <div className="card" style={{ maxWidth: 286 }}>
        <img
          src="" //{jobPost.primaryImage.imageUrl}
          className="card-img-top"
          alt=" I Love Code"
          style={{ maxWidth: 286, height: 180 }}
        />
        <div className="card-body">
          <h5 className="card-title center-text">
            {jobPost.summary} {jobPost.headline}
          </h5>
          <p className="card-text mx-auto" style={{ maxHeight: 100 }}>
            {jobPost.bio}
          </p>
          <div className="row">
            <button
              type="button"
              //data-page={`${friend.id}`}
              className="link-btn btn btn-warning mx-auto"
              //   onClick={onLocalEditClicked}
              style={{ width: 100 }}
            >
              Edit Job
            </button>
            <button
              type="button"
              className="link-btn btn btn-danger mx-auto"
              //   onClick={onLocalRemoveClicked}
              style={{ width: 100 }}
            >
              Remove Job
            </button>
            {/* Modal button*/}
            <button
              type="button"
              className="btn btn-primary mx-auto"
              data-bs-toggle="modal"
              data-bs-target="#staticBackdrop"
            >
              Launch static backdrop modal
            </button>

            {/* Modal */}
            <div
              className="modal fade"
              data-bs-backdrop="static"
              data-bs-keyboard="false"
              tabindex="-1"
              aria-labelledby="staticBackdropLabel"
              aria-hidden="true"
            >
              <div className="modal-dialog modal-dialog-scrollable">
                <div className="modal-content">
                  <div className="modal-header">
                    <h5 className="modal-title">Modal title</h5>
                    <button
                      type="button"
                      className="btn-close"
                      data-bs-dismiss="modal"
                      aria-label="Close"
                    ></button>
                  </div>
                  <div className="modal-body">...</div>
                  <div className="modal-footer">
                    <button
                      type="button"
                      className="btn btn-secondary"
                      data-bs-dismiss="modal"
                    >
                      Close
                    </button>
                    <button type="button" className="btn btn-primary">
                      Understood
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default JobsRendering;
