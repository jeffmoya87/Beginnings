using System.Models.Domain;
using System.Models.Requests.Users;
using System.Collections.Generic;

namespace System.Services
{
    public interface IUserServices
    {
        int Add(UserAddRequest model, int userId);
        void Delete(int id);
        User Get(int id);
        List<User> GetAll();
        void Update(UserUpdateRequest model);
    }
}
