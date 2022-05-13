using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.Models.Requests.Users
{
    public class UserUpdateRequest: UserAddRequest
    {
        public int Id { get; set; }
        
    }
}
