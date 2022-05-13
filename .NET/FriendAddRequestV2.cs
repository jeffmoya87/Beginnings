using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.Models.Requests.Friends
{
    public class FriendAddRequestV2: FriendAddRequest
    {
        
        public int TypeId { get; set; }

        public string Url { get; set; }

        public string Name { get; set; }

        public List<FriendSkill> FriendSkills { get; set; }

    }
}
