using Sabio.Models.Domain;
using Sabio.Models.Requests.Addresses;
using System.Collections.Generic;

namespace Sabio.Services
{
    public interface IAddressesServices
    {
        int Add(AddressAddRequest model, int userId);
        Address Get(int id);
        List<Address> GetTop();
        void Update(AddressUpdateRequest model);
        void Delete(int id);
    }
}