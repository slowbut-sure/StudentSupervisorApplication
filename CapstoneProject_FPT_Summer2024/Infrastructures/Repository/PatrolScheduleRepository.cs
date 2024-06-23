﻿using Domain.Entity;
using Infrastructures.Interfaces;
using Infrastructures.Repository.GenericRepository;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructures.Repository
{
    public class PatrolScheduleRepository : GenericRepository<PatrolSchedule>, IPatrolScheduleRepository
    {
        public PatrolScheduleRepository(SchoolRulesContext context): base(context) { }

        public async Task<List<PatrolSchedule>> GetAllPatrolSchedules()
        {
            return await _context.PatrolSchedules.ToListAsync();
        }

        public async Task<PatrolSchedule> GetPatrolScheduleById(int id)
        {
            return await _context.PatrolSchedules.FirstOrDefaultAsync(x => x.ScheduleId == id);
        }

        public async Task<List<PatrolSchedule>> SearchPatrolSchedules(int? classId, int? supervisorId, int? teacherId, DateTime? from, DateTime? to)
        {
            var query = _context.PatrolSchedules.AsQueryable();

            if (classId != null)
            {
                query = query.Where(p => p.ClassId == classId);
            }
            if (supervisorId != null)
            {
                query = query.Where(p => p.SupervisorId == supervisorId);
            }
            if (teacherId != null)
            {
                query = query.Where(p => p.TeacherId == teacherId);
            }
            if (from != null)
            {
                query = query.Where(p => p.From >= from);
            }
            if (to != null)
            {
                query = query.Where(p => p.To <= to);
            }

            return await query.ToListAsync();
        }
        public async Task<PatrolSchedule> CreatePatrolSchedule(PatrolSchedule patrolScheduleEntity)
        {
            await _context.PatrolSchedules.AddAsync(patrolScheduleEntity);
            await _context.SaveChangesAsync();
            return patrolScheduleEntity;
        }

        public async Task<PatrolSchedule> UpdatePatrolSchedule(PatrolSchedule patrolScheduleEntity)
        {
            _context.PatrolSchedules.Update(patrolScheduleEntity);
            await _context.SaveChangesAsync();
            return patrolScheduleEntity;
        }

        public async Task DeletePatrolSchedule(int id)
        {
            throw new NotImplementedException();
        }
    }
}
