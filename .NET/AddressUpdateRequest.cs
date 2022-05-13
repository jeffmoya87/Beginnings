using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.Models.Requests.Addresses
{
    public class AddressUpdateRequest: AddressAddRequest, IModelIdentifier
    {
        //This "required" and "range" are not necessary because the IModelIdentifier takes care of that for us
		//[Required]
        //[Range(1,Int32.MaxValue)]
        public int Id { get; set; }
        
    }
}
