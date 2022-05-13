using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.Models.Requests.Friends
{
    public class FriendUpdateRequest: FriendAddRequest
    {
        public int Id { get; set; }
    }
}
