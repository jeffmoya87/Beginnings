using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Build.Utilities;
using Microsoft.Extensions.Logging;
using Sabio.Models;
using Sabio.Models.Coding_Challenge;
using Sabio.Services;
using Sabio.Services.Coding_Challenge;
using Sabio.Web.Controllers;
using Sabio.Web.Models.Responses;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Policy;

namespace Sabio.Web.Api.Controllers.Coding_Challenge
{
    [Route("api/course")]
    [ApiController]
    public class CourseApiController : BaseApiController
    {
        private ICourseServices _service = null;
        private IAuthenticationService<int> _authService = null;

        public CourseApiController(ICourseServices service
            , ILogger<CourseApiController> logger
            , IAuthenticationService<int> authService) : base(logger)
        {
            _service = service;
            _authService = authService;
        }


        [HttpPost]
        public ActionResult<ItemResponse<int>> Create(CourseAddRequest model)
        {
            ObjectResult result = null;

            try
            {
                int courseId = _authService.GetCurrentUserId();

                int id = _service.Create(model, courseId);
                ItemResponse<int> response = new ItemResponse<int>() { Item = courseId };
                result = Created201(response);
            }
            catch (Exception ex)
            {
                Logger.LogError(ex.ToString());
                ErrorResponse response = new ErrorResponse($"Generic Error: ${ex.Message}");
                result = StatusCode(500, response);
            }
            return result;
        }

        [HttpGet("{id:int}")]
        public ActionResult<ItemResponse<Course>> Get(int id)
        {
            int code = 200;
            BaseResponse response = null;

            try
            {
                Course course = _service.Get(id);

                if(course == null)
                {
                    code = 400;
                    response = new ErrorResponse("App resource not found");
                }
                else
                {
                    response = new ItemResponse<Course> { Item = course };
                }
            }
            catch(Exception ex)
            {
                code = 500;
                base.Logger.LogError(ex.ToString());
                response = new ErrorResponse($"Generic Error: ${ex.Message}");
            }
            return StatusCode(code, response);
        }

        [HttpPut("{id:int}")]
        public ActionResult<ItemResponse<int>> Update(CourseUpdateRequest model)
        {
            int code = 200;
            BaseResponse response = null;
            try
            {
                _service.Update(model);

                response = new SuccessResponse();
            }
            catch(Exception ex)
            {
                code = 500;

                response = new ErrorResponse($"Generic Error: ${ex.Message}");
            }
            return StatusCode(code, response);
        }

        [HttpDelete("{id:int}")]
        public ActionResult<SuccessResponse> Delete(int id)
        {
            int code = 200;
            BaseResponse response = null; 

            try
            {
                _service.Delete(id);

                response = new SuccessResponse();
            }
            catch(Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
            }
            return StatusCode(code, response);
        }
    }
}
