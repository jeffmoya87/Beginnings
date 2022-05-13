using System.Models;
using System.Models.Domain;
using System.Models.Requests.Friends;
using System.Collections.Generic;

namespace System.Services.Interfaces
{
    public interface IFriendServicesV2
    {
       
        int AddFriends(FriendAddRequestV2 model, int userId);
        FriendV2 Get(int id);
        Paged<FriendV2> Pagination(int pageIndex, int pageSize);
        Paged<FriendV2> SearchPaginate(int pageIndex, int pageSize, string query);
    }
}
