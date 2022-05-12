import axios from "axios";

const endpoint = "secret";

const getJobs = (pageIndex, pageSize) => {
  const config = {
    method: "GET",
    url: endpoint + `?pageIndex=${pageIndex}&pageSize=${pageSize}`,
    withCredentials: true,
    crossdomain: true,
    headers: { "Content-Type": "application/json" },
  };

  return axios(config);
};

const jobServices = { getJobs };

export default jobServices;
