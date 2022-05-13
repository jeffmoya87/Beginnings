using Sabio.Models;
using Sabio.Models.Domain;
using Sabio.Models.Requests.Friends;
using System.Collections.Generic;

namespace Sabio.Services.Interfaces
{
    public interface IFriendServicesV2
    {
       
        int AddFriends(FriendAddRequestV2 model, int userId);
        FriendV2 Get(int id);
        Paged<FriendV2> Pagination(int pageIndex, int pageSize);
        Paged<FriendV2> SearchPaginate(int pageIndex, int pageSize, string query);
    }
}
