import React, { useState, useEffect } from "react";
import jobServices from "../../services/jobServices";
import JobsRendering from "./JobsRendering";

function Jobs() {
  const [jobsInfo, setJobsInfo] = useState({
    jobsArr: [],
    jobsComponents: [],
    pageIndex: 0,
    pageSize: 4,
  });

  useEffect(() => {
    callJobs(jobsInfo.pageIndex, jobsInfo.pageSize);
  }, []);

  const callJobs = (pageIndex, pageSize) => {
    jobServices
      .getJobs(pageIndex, pageSize)
      .then(onCallJobsSuccess)
      .catch(onCallJobsFail);
  };

  const onCallJobsSuccess = (response) => {
    console.log("call Jobs ok", response);
    const newJobsArr = response.data.item.pagedItems;
    setJobsInfo((prevState) => {
      const pd = { ...prevState };
      pd.jobsArr = newJobsArr;
      pd.jobsComponents = newJobsArr.map(mapJobs);
      return pd;
    });
  };

  const mapJobs = (job) => {
    return <JobsRendering aJob={job} key={job.slug} />;
  };

  const onCallJobsFail = (err) => {
    console.error("callJobs bad", err);
  };

  return (
    <React.Fragment>
      <h1>Jobs</h1>;
      <div className="jobs-container">
        <div className="row">{jobsInfo.jobsComponents}</div>
      </div>
    </React.Fragment>
  );
}

export default Jobs;
