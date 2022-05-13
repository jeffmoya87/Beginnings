using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Providers;
using System.Models.Domain;
using System.Models.Requests.Addresses;
using System.Models.Requests.Friends;
using System.Models.Requests.Users;

namespace System.Services
{
    public class UserServices : IUserServices
    {
        IDataProvider _data = null;

        public UserServices(IDataProvider data)
        {
            _data = data;
        }

        public User Get(int id)
        {
            string procName = "[dbo].[Users_SelectById]";
            User user = null;

            _data.ExecuteCmd(procName, delegate (SqlParameterCollection paramCollection)
            {
                paramCollection.AddWithValue("@Id", id);
            }, delegate (IDataReader reader, short set)
            {
                user = MapUser(reader);
            });
            return user;
        }

        public void Delete(int id)
        {
            string procName = "[dbo].[Users_Delete]";

            _data.ExecuteNonQuery(procName, delegate (SqlParameterCollection paramCollection)
            {
                paramCollection.AddWithValue("@Id", id);
            });
        }
        public List<User> GetAll()
        {
            List<User> list = null;

            string procName = "[dbo].[Users_SelectAll]";

            _data.ExecuteCmd(procName, inputParamMapper: null,
                singleRecordMapper: delegate (IDataReader reader, short set)
                {
                    User user = MapUser(reader);
                    if (list == null)
                    {
                        list = new List<User>();
                    }
                    list.Add(user);
                });
            return list;
        }

        public int Add(UserAddRequest model, int userId)
        {
            int id = 0;

            string procName = "[dbo].[Users_Insert]";

            _data.ExecuteNonQuery(procName, inputParamMapper: delegate (SqlParameterCollection col)
            {
                SqlParameter idOut = new SqlParameter("@Id", SqlDbType.Int);
                idOut.Direction = ParameterDirection.Output;
                AddCommonParams(model, col);
                col.Add(idOut);
            }, returnParameters: delegate (SqlParameterCollection returnCollection)
            {
                object uId = returnCollection["@Id"].Value;

                int.TryParse(uId.ToString(), out id);
            });
            return id;
        }

        public void Update(UserUpdateRequest model)
        {
            string procName = "[dbo].[Users_Update]";
            _data.ExecuteNonQuery(procName,
                inputParamMapper: delegate (SqlParameterCollection col)
                {
                    col.AddWithValue("@Id", model.Id);
                    AddCommonParams(model, col);
                },
                returnParameters: null);
        }
        private static void AddCommonParams(UserAddRequest model, SqlParameterCollection col)
        {
            col.AddWithValue("@FirstName", model.FirstName);
            col.AddWithValue("@LastName", model.LastName);
            col.AddWithValue("@Email", model.Email);
            col.AddWithValue("@AvatarUrl", model.AvatarUrl);
            col.AddWithValue("@TenantId", model.TenantId);
            col.AddWithValue("@Password", model.Password);
            col.AddWithValue("@PasswordConfirm", model.PasswordConfirm);
        }

        private static User MapUser(IDataReader reader)
        {
            User aUser = new User();

            int startingIndex = 0;

            aUser.FirstName = reader.GetSafeString(startingIndex++);
            aUser.LastName = reader.GetSafeString(startingIndex++);
            aUser.Email = reader.GetSafeString(startingIndex++);
            aUser.AvatarUrl = reader.GetSafeString(startingIndex++);
            aUser.TenantId = reader.GetSafeString(startingIndex++);
            aUser.Password = reader.GetSafeString(startingIndex++);
            aUser.PasswordConfirm = reader.GetSafeString(startingIndex++);
            aUser.Id = reader.GetSafeInt32(startingIndex++);

            return aUser;
        }

        
    }
}
