using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Models;
using System.Models.Domain;
using System.Models.Requests.Addresses;
using System.Services;
using System.Web.Controllers;
using System.Web.Models.Responses;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace System.Web.Api.Controllers
{
    [Route("api/addresses")]
    [ApiController]
    public class AddressApiController1 : BaseApiController
    {
        private IAddressesServices _service = null;
        private IAuthenticationService<int> _authService = null;

        public AddressApiController1(IAddressesServices service
            , ILogger<AddressApiController1> logger
            , IAuthenticationService<int> authService) : base(logger)
        {
            _service = service;
            _authService = authService;
        }

        // concatinates api/addresses (from above) with that HttpGet string down there on that line below
        [HttpGet("")]//can write this one without the quotes as just [HttpGet]
        public ActionResult<ItemsResponse<Address>> GetAll()
        {
            int code = 200;
            BaseResponse response = null;//don't declare an instance here because it takes up memory unnecessarily

            try
            {
                List<Address> list = _service.GetTop();

                if (list == null)
                {
                    code = 404;
                    response = new ErrorResponse("App resource not found");
                }
                else
                {
                    response = new ItemsResponse<Address> { Items = list };
                }
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
                base.Logger.LogError(ex.ToString());
            }

            return StatusCode(code, response);
        }

        //this is telling it to go to this url 
        //api/addresses/{id:int}
        [HttpGet("{id:int}")]//this matches the param in Get() down there
        public ActionResult<ItemResponse<Address>> Get(int id) //read this as Get(By id) because the id is the param
        {
            int iCode = 200;
            BaseResponse response = null;

            try
            {
                Address address = _service.Get(id);

                //ItemResponse<Address> response = new ItemResponse<Address>();
                //response.Item = a;

                if (address == null)
                {
                    iCode = 404;
                    response = new ErrorResponse("Application resource not found");
                }
                else
                {
                    response = new ItemResponse<Address> { Item = address };
                }


            }
            catch (SqlException sqlEx)
            {
                iCode = 500;

                response = new ErrorResponse(sqlEx.Message);
                base.Logger.LogError(sqlEx.ToString());
            }
            catch (ArgumentException argEx)
            {
                iCode = 500;

                response = new ErrorResponse(argEx.Message);
            }
            catch (Exception ex)

            {
                iCode = 500;
                base.Logger.LogError(ex.ToString());
                response = new ErrorResponse($"Generic Error: ${ ex.Message}");

            }

            return StatusCode(iCode, response);
        }

        [HttpDelete("{id:int}")]
        public ActionResult<SuccessResponse> Delete(int id)
        {
            int code = 200;
            BaseResponse response = null;//don't declare an instance here because it takes up memory unnecessarily

            try
            {
                _service.Delete(id);

                response = new SuccessResponse();
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
            }

            return StatusCode(code, response);
        }

        [HttpPost]
        public ActionResult<ItemResponse<int>> Create(AddressAddRequest model)
        {
            // this is the id of the new Address
            int userId = _authService.GetCurrentUserId();//this only gets the currentUsers Id, which might be all I need
            IUserAuthData user = _authService.GetCurrentUser();//this gets the whole user
            int id = _service.Add(model, user.Id);

            ItemResponse<int> response = new ItemResponse<int>();

            response.Item = id;

            return Ok(response);
        }

        [HttpPut("{id:int}")]
        public ActionResult<ItemResponse<int>> Update(AddressUpdateRequest model)
        {
            _service.Update(model);

            SuccessResponse response = new SuccessResponse();

            return Ok(response);
        }
    }
}
