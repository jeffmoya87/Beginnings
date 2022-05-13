using Sabio.Models;
using Sabio.Models.Domain;
using Sabio.Models.Requests.Friends;
using System.Collections.Generic;

namespace Sabio.Services
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