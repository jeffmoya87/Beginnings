using Newtonsoft.Json;
using Sabio.Data;
using Sabio.Data.Providers;
using Sabio.Models;
using Sabio.Models.Domain;
using Sabio.Models.Requests.Friends;
using Sabio.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sabio.Services
{
    public class FriendServicesV2 : IFriendServicesV2
    {
        IDataProvider _data = null;

        public FriendServicesV2(IDataProvider data)
        {
            _data = data;
        }

        public FriendV2 Get(int id)
        {
            string procName = "[dbo].[Friends_SelectByIdV3]";
            FriendV2 friend = null;

            _data.ExecuteCmd(procName, delegate (SqlParameterCollection paramCollection)
            {
                paramCollection.AddWithValue("@Id", id);
            }, delegate (IDataReader reader, short set)
            {
                friend = MapFriend(reader);
                

            });
            return friend;
        }

        public Paged<FriendV2> Pagination(int pageIndex, int pageSize)
        {
            string procName = "[dbo].[Friends_PaginationV2]";
            Paged<FriendV2> pagedList = null;
            List<FriendV2> list = null;
            int totalCount = 0;

            _data.ExecuteCmd(procName, delegate (SqlParameterCollection paramCollection)
            {
                paramCollection.AddWithValue("@Index", pageIndex);
                paramCollection.AddWithValue("@PageSize", pageSize);
            }, delegate (IDataReader reader, short set)
            {
                FriendV2 friend = MapFriend(reader);
                totalCount = reader.GetSafeInt32(10);

                if (list == null)
                {
                    list = new List<FriendV2>();
                }

                list.Add(friend);
            });
            if(list != null)
            {
                pagedList = new Paged<FriendV2>(list, pageIndex, pageSize, totalCount);
            }
            return pagedList;
        }

        public Paged<FriendV2> SearchPaginate(int pageIndex, int pageSize, string query)
        {
            string procName = "[dbo].[Friends_Search_PaginationV2]";
            Paged<FriendV2> pagedList = null;
            List<FriendV2> list = null;
            int totalCount = 0;

            _data.ExecuteCmd(procName, delegate (SqlParameterCollection paramCollection)
            {
                paramCollection.AddWithValue("@Index", pageIndex);
                paramCollection.AddWithValue("@PageSize", pageSize);
                paramCollection.AddWithValue("@Query", query);
            }, delegate (IDataReader reader, short set)
            {
                FriendV2 friend = MapFriend(reader);
                totalCount = reader.GetSafeInt32(10);

                if (list == null)
                {
                    list = new List<FriendV2>();
                }
                list.Add(friend);
            });
            if(list != null)
            {
                pagedList = new Paged<FriendV2>(list, pageIndex, pageSize, totalCount);
            }
            return pagedList;
        }

        public int AddFriends(FriendAddRequestV2 model, int userId)
        {
            int id = 0;

            string procName = "[dbo].[Friends_Batch_Insert]";
            DataTable myParamValue = MapFriendsToTable(model.FriendSkills);

            _data.ExecuteNonQuery(procName, inputParamMapper: delegate (SqlParameterCollection sqlParams)
            {
                SqlParameter idOut = new SqlParameter("@Id", SqlDbType.Int);
                idOut.Direction = ParameterDirection.Output;
                
                CommonParams(model, sqlParams);
                sqlParams.AddWithValue("@batchSkills", myParamValue);
                sqlParams.Add(idOut);
            }, returnParameters: delegate (SqlParameterCollection returnCollection)
            {
                object fId = returnCollection["@Id"].Value;

                int.TryParse(fId.ToString(), out id);
            });
            return id;
        }

        private static void CommonParams(FriendAddRequestV2 mod, SqlParameterCollection sqlParams)
        {
            sqlParams.AddWithValue("@Title", mod.Title);
            sqlParams.AddWithValue("@Bio", mod.Bio);
            sqlParams.AddWithValue("@Summary", mod.Summary);
            sqlParams.AddWithValue("@Headline", mod.Headline);
            sqlParams.AddWithValue("@Slug", mod.Slug);
            sqlParams.AddWithValue("@StatusId", mod.StatusId);
            sqlParams.AddWithValue("@TypeId", mod.TypeId);
            sqlParams.AddWithValue("@Url", mod.Url);
        }

        private DataTable MapFriendsToTable(List<FriendSkill> friendsToMap)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Name", typeof(string));

            foreach (FriendSkill friendSkill in friendsToMap)
            {
                DataRow dr = dt.NewRow();
                int startingIndex = 0;

                dr.SetField(startingIndex++, friendSkill.Name);

                dt.Rows.Add(dr);
            }

            return dt;
        }

        private static FriendV2 MapFriend(IDataReader reader)
        {
            FriendV2 aFriend = new FriendV2();

            int startingIndex = 0;

            aFriend.Title = reader.GetSafeString(startingIndex++);
            aFriend.Bio = reader.GetSafeString(startingIndex++);
            aFriend.Summary = reader.GetSafeString(startingIndex++);
            aFriend.Headline = reader.GetSafeString(startingIndex++);
            aFriend.Slug = reader.GetSafeString(startingIndex++);
            aFriend.StatusId = reader.GetSafeBool(startingIndex++);
            aFriend.Id = reader.GetSafeInt32(startingIndex++);
            aFriend.PrimaryImageId = reader.GetSafeInt32(startingIndex++);
            aFriend.Url = reader.GetSafeString(startingIndex++);
            aFriend.Skills = reader.DeserializeObject<List<Skill>>(startingIndex++);

            return aFriend;
        }
    }
}
