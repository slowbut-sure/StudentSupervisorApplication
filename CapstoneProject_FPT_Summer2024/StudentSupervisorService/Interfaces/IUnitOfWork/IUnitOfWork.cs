﻿using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentSupervisorService.Interfaces.IUnitOfWork
{
    public interface IUnitOfWork
    {
        IDbContextTransaction StartTransaction(string name);
        void StopTransaction(IDbContextTransaction commit);
        void RollBack(IDbContextTransaction commit, string name);
        int Save();
    }
}
