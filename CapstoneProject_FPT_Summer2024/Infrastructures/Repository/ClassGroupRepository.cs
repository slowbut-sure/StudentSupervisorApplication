﻿using Domain.Entity;
using Infrastructures.Interfaces;
using Infrastructures.Repository.GenericRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructures.Repository
{
    public class ClassGroupRepository : GenericRepository<ClassGroup>, IClassGroupRepository
    {
        public ClassGroupRepository(SchoolRulesContext context) : base(context) { }


    }
}
