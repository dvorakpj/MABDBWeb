using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataUtils
{
    public interface IGenManagePermIDs
    {

        string AllocatePermId(int internalId);
        int GetMaxPermIdCharLength();      
    }

    public interface IManagePermMABuyerID
    {
        int GetMaxPermIdCharLength();
        string AllocatePermMABID(int internalID);
        int GetMaxMABPermIdLength();
        string AllocatePermAssqInvID(int internalID);
        string AllocatePermPropID(int internalID);

    }
    public class PermIDManager : IManagePermMABuyerID
    {
        public string GetMABPermIDPrefix()
        {
            return "M";
        }

        public string AllocatePermAssqInvID(int internalID)
        {
            throw new NotImplementedException();
        }

        public string AllocatePermMABID(int internalID)
        {
            string intIds = null;
            if (internalID > 0)
            {
                intIds = internalID.ToString();
            } else
            {
                throw new ApplicationException("PermID cannot be assigned, missing incremental part.");
            };

            return this.GetMABPermIDPrefix() + intIds;
        }

        public string AllocatePermPropID(int internalID)
        {
            throw new NotImplementedException();
        }

        public int GetMaxMABPermIdLength()
        {
            return 20;
        }

        public int GetMaxPermIdCharLength()
        {
            throw new NotImplementedException();
        }
    }
}
