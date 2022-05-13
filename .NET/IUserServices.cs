using Sabio.Models.Domain;
using Sabio.Models.Requests.Users;
using System.Collections.Generic;

namespace Sabio.Services
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