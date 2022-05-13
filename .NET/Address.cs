using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sabio.Models.Domain
{
    public class Address : BaseAddress
    {
        //represents data coming out
        //for data coming from the database

        //we want to fully saturate ALL data given
        //this is why we have a "baseaddress"
        //so if we don't want to use all data here
        //we make children and inherit them like react
        
       public bool IsActive { get; set; }
        public double Lat { get; set; }
        public double Long { get; set; }

    }
}
