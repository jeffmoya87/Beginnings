using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Models;
using System.Models.Domain;
using System.Models.Requests.Friends;
using System.Services;
using System.Services.Interfaces;
using System.Web.Controllers;
using System.Web.Models.Responses;
using System;

namespace System.Web.Api.Controllers
{
    [Route("api/friends2")]
    [ApiController]
    public class FriendApiControllerV2 : BaseApiController
    {
        private IFriendServicesV2 _service = null;
        private IAuthenticationService<int> _authService = null;

        public FriendApiControllerV2(IFriendServicesV2 service
            , ILogger<FriendApiControllerV2> logger
            , IAuthenticationService<int> authService) : base(logger)
        {
            _service = service;
            _authService = authService;
        }

        [HttpGet("{id:int}")]
        public ActionResult<ItemResponse<FriendV2>> Get(int id)
        {
            int code = 200;
            BaseResponse response = null;

            try
            {
                FriendV2 friend = _service.Get(id);

                if(friend == null)
                {
                    code = 400;
                    response = new ErrorResponse("App resource not found");
                }
                else
                {
                    response = new ItemResponse<FriendV2> { Item = friend };
                }
            }
            catch (Exception ex)
            {
                code = 500;
                base.Logger.LogError(ex.ToString());
                response = new ErrorResponse($"Generic Error: ${ex.Message}");
            }
            return StatusCode(code, response);
        }

        [HttpGet("paginate")]
        public ActionResult<ItemResponse<Paged<FriendV2>>> Pagination(int pageIndex, int pageSize)
        {
            ActionResult result = null;
            try
            {
                Paged<FriendV2> paged = _service.Pagination(pageIndex, pageSize);
                if(paged == null)
                {
                    result = NotFound404(new ErrorResponse("Records Not Found"));
                }
                else
                {
                    ItemResponse<Paged<FriendV2>> response = new ItemResponse<Paged<FriendV2>>();
                    response.Item = paged;
                    result = Ok200(response);
                }
            }
            catch(Exception ex)
            {
                Logger.LogError(ex.ToString());
                result = StatusCode(500, new ErrorResponse(ex.Message.ToString()));
            }
            return result;
        }

        [HttpGet("search")]
        public ActionResult<ItemResponse<Paged<FriendV2>>> SearchPaginate(int pageIndex, int pageSize, string query)
        {
            ActionResult result = null;
            try
            {
                Paged<FriendV2> paged = _service.SearchPaginate(pageIndex, pageSize, query);
                if(paged == null)
                {
                    result = NotFound404(new ErrorResponse("Records Not Found"));
                }
                else
                {
                    ItemResponse<Paged<FriendV2>> response = new ItemResponse<Paged<FriendV2>>();
                    response.Item = paged;
                    result = Ok200(response);
                }
            }
            catch(Exception ex)
            {
                Logger.LogError(ex.ToString());
                result = StatusCode(500, new ErrorResponse(ex.Message.ToString()));
            }
            return result;
        }

        [HttpPost]
        public ActionResult<ItemResponse<int>> Create(FriendAddRequestV2 model)
        {
            ObjectResult result = null;

            try
            {
                int friendId = _authService.GetCurrentUserId();

                int id = _service.AddFriends(model, friendId);
                ItemResponse<int> response = new ItemResponse<int>() { Item = friendId };
                result = Created201(response);
            }
            catch(Exception ex)
            {
                Logger.LogError(ex.ToString());
                ErrorResponse response = new ErrorResponse($"Generic Error: ${ex.Message}");
                result = StatusCode(500, response);
            }

            return result;
        }
    }
}
