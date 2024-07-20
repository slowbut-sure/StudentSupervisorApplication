﻿using Domain.Entity;
using Infrastructures.Interfaces.IGenericRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructures.Interfaces
{
    public interface IViolationRepository : IGenericRepository<Violation>
    {
        Task<List<Violation>> GetAllViolations();
        Task<Violation> GetViolationById(int id);
        Task<List<Violation>> SearchViolations(
            int? classId, 
            int? violationTypeId,
            int? studentInClassId,
            int? teacherId,
            string? name,
            string? description,
            DateTime? date,
            string? status
            );
        Task<Violation> CreateViolation(Violation violationEntity);
        Task<Violation> UpdateViolation(Violation violationEntity);
        Task DeleteViolation(int id);
        Task<List<Violation>> GetViolationsByStudentId(int studentId);
        Task<List<Violation>> GetViolationsByStudentIdAndYear(int studentId, int schoolYearId);
        Task<Dictionary<int, int>> GetViolationCountByYear(int studentId);
        Task<List<Violation>> GetApprovedViolations();
        Task<List<Violation>> GetPendingViolations();
        Task<List<Violation>> GetRejectedViolations();
        Task<List<Violation>> GetInactiveViolations();
        Task<List<Violation>> GetViolationsBySchoolId(int schoolId);
        Task<List<Violation>> GetViolationsByMonthAndWeek(short year, int month, int? weekNumber = null);
        Task<List<Violation>> GetViolationsByYearAndClassName(short year, string className);
    }
}
