using System.Models.Domain;
using System.Models.Requests.Addresses;
using System.Collections.Generic;

namespace System.Services
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
