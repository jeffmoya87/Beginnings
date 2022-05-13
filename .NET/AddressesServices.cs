using System.Data.Providers;
using System.Models.Domain;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Models.Requests.Addresses;

namespace System.Services
{
    public class AddressesServices : IAddressesServices
    {
        IDataProvider _data = null;
        public AddressesServices(IDataProvider data)
        {
            _data = data;
        }

        public void Update(AddressUpdateRequest model)
        {
            string procName = "[dbo].[Sabio_Addresses_Update]";
            _data.ExecuteNonQuery(procName,
                inputParamMapper: delegate (SqlParameterCollection col)
                {
                    col.AddWithValue("@Id", model.Id);
                    AddCommonParams(model, col);
                },
            returnParameters: null);

        }



        public int Add(AddressAddRequest model, int userId)
        {
            int id = 0;

            string procName = "[dbo].[Sabio_Addresses_Insert]";
            _data.ExecuteNonQuery(procName, inputParamMapper: delegate (SqlParameterCollection col)
            {
                //and one Output
                SqlParameter idOut = new SqlParameter("@Id", SqlDbType.Int);
                idOut.Direction = ParameterDirection.Output;

                col.Add(idOut);

                AddCommonParams(model, col);
            },
            returnParameters: delegate (SqlParameterCollection returnCollection)
            {
                object oId = returnCollection["@Id"].Value;

                Int32.TryParse(oId.ToString(), out id);
            });

            return id;
        }

        public Address Get(int id)
        {
            string procName = "[dbo].[Sabio_Addresses_SelectById]";

            Address address = null;

            _data.ExecuteCmd(procName, delegate (SqlParameterCollection paramCollection)
            {
                //oneShape > secondShape

                //int > param (int)

                paramCollection.AddWithValue("@Id", id);

            }, delegate (IDataReader reader, short set) //single Record Mapper
            {
                //oneShape > secondShape

                //reader from DB >>> Widget
                //will execute one time for every record thats returned to the database

                address = MapAddress(reader);
            }
            );

            return address;
        }

        public List<Address> GetTop()
        {
            List<Address> list = null;

            string procName = "[dbo].[Sabio_Addresses_SelectRandom50]";

            _data.ExecuteCmd(procName, inputParamMapper: null,
                singleRecordMapper: delegate (IDataReader reader, short set)
                {
                    //oneShape > secondShape

                    //reader from DB >>> Widget
                    //will execute one time for every record thats returned to the database

                    Address anAddress = MapAddress(reader);

                    if (list == null)
                    {
                        list = new List<Address>();
                    }

                    list.Add(anAddress);

                });

            return list;
        }

        public void Delete(int id)
        {
            string procName = "[dbo].[Sabio_Addresses_DeleteById]";

            _data.ExecuteNonQuery(procName, delegate (SqlParameterCollection paramCollection)
            {
                paramCollection.AddWithValue("@Id", id);
            });
        }
        private static Address MapAddress(IDataReader reader)
        {
            Address anAddress = new Address();

            int startingIndex = 0;

            anAddress.Id = reader.GetSafeInt32(startingIndex++);
            anAddress.LineOne = reader.GetSafeString(startingIndex++);
            anAddress.SuiteNumber = reader.GetSafeInt32(startingIndex++);
            anAddress.City = reader.GetSafeString(startingIndex++);
            anAddress.State = reader.GetSafeString(startingIndex++);
            anAddress.PostalCode = reader.GetSafeString(startingIndex++);
            anAddress.IsActive = reader.GetSafeBool(startingIndex++);
            anAddress.Lat = reader.GetSafeDouble(startingIndex++);
            anAddress.Long = reader.GetSafeDouble(startingIndex++);
            return anAddress;
        }
        private static void AddCommonParams(AddressAddRequest model, SqlParameterCollection col)
        {
            col.AddWithValue("@LineOne", model.LineOne);
            col.AddWithValue("@SuiteNumber", model.SuiteNumber);
            col.AddWithValue("@City", model.City);
            col.AddWithValue("@State", model.State);
            col.AddWithValue("@PostalCode", model.PostalCode);
            col.AddWithValue("@IsActive", model.IsActive);
            col.AddWithValue("@Lat", model.Lat);
            col.AddWithValue("@Long", model.Long);
        }
    }
}
