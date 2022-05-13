using System.Models;
using System.Models.Domain;
using System.Models.Requests.Friends;
using System.Collections.Generic;

namespace System.Services
{
    public interface IFriendServices
    {
        int Add(FriendAddRequest model, int userId);
        void Delete(int id);
        Friend Get(int id);
        List<Friend> GetAll();
        Paged<Friend> Pagination(int pageIndex, int pageSize);
        PagedV2<Friend> SearchPaginate(int pageIndex, int pageSize, string query);
        void Update(FriendUpdateRequest model);
    }
}
