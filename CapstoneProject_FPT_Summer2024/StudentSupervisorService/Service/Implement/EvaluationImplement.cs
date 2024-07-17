﻿using AutoMapper;
using Domain.Entity;
using Infrastructures.Interfaces.IUnitOfWork;
using StudentSupervisorService.Models.Request.EvaluationRequest;
using StudentSupervisorService.Models.Response;
using StudentSupervisorService.Models.Response.EvaluationResponse;


namespace StudentSupervisorService.Service.Implement
{
    public class EvaluationImplement : EvaluationService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public EvaluationImplement(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        public async Task<DataResponse<List<EvaluationResponse>>> GetAllEvaluations(string sortOrder)
        {
            var response = new DataResponse<List<EvaluationResponse>>();
            try
            {

                var evaluationEntities = await _unitOfWork.Evaluation.GetAllEvaluations();
                if (evaluationEntities is null || !evaluationEntities.Any())
                {
                    response.Message = "The Evaluation list is empty";
                    response.Success = true;
                    return response;
                }

                evaluationEntities = sortOrder == "desc"
                    ? evaluationEntities.OrderByDescending(r => r.From).ToList()
                    : evaluationEntities.OrderBy(r => r.From).ToList();

                response.Data = _mapper.Map<List<EvaluationResponse>>(evaluationEntities);
                response.Message = "List Evaluation";
                response.Success = true;

            }
            catch (Exception ex)
            {
                response.Message = "Oops! Something went wrong.\n" + ex.Message
                    + (ex.InnerException != null ? ex.InnerException.Message : "");
                response.Success = false;
            }
            return response;
        }

        public async Task<DataResponse<EvaluationResponse>> GetEvaluationById(int id)
        {
            var response = new DataResponse<EvaluationResponse>();
            try
            {
                var evaluationEntity = await _unitOfWork.Evaluation.GetEvaluationById(id);
                if (evaluationEntity == null)
                {
                    response.Message = "Evaluation not found";
                    response.Success = false;
                    return response;
                }

                response.Data = _mapper.Map<EvaluationResponse>(evaluationEntity);
                response.Message = "Found a Evaluation";
                response.Success = true;
            }
            catch (Exception ex)
            {
                response.Message = "Oops! Something went wrong.\n" + ex.Message
                    + (ex.InnerException != null ? ex.InnerException.Message : "");
                response.Success = false;
            }
            return response;
        }

        public async Task<DataResponse<List<EvaluationResponse>>> SearchEvaluations(int? schoolYearId, int? violationConfigID, string? desciption, DateTime? from, DateTime? to, short? point, string sortOrder)
        {
            var response = new DataResponse<List<EvaluationResponse>>();

            try
            {
                var evaluationEntities = await _unitOfWork.Evaluation.SearchEvaluations(schoolYearId, violationConfigID ,desciption, from, to, point);
                if (evaluationEntities is null || evaluationEntities.Count == 0)
                {
                    response.Message = "No Evaluation matches the search criteria";
                    response.Success = true;
                }
                else
                {
                    if (sortOrder == "desc")
                    {
                        evaluationEntities = evaluationEntities.OrderByDescending(r => r.From).ToList();
                    }
                    else
                    {
                        evaluationEntities = evaluationEntities.OrderBy(r => r.From).ToList();
                    }
                    response.Data = _mapper.Map<List<EvaluationResponse>>(evaluationEntities);
                    response.Message = "List Evaluation";
                    response.Success = true;
                }
            }
            catch (Exception ex)
            {
                response.Message = "Oops! Something went wrong.\n" + ex.Message
                    + (ex.InnerException != null ? ex.InnerException.Message : "");
                response.Success = false;
            }
            return response;
        }
        public async Task<DataResponse<EvaluationResponse>> CreateEvaluation(EvaluationCreateRequest request)
        {
            var response = new DataResponse<EvaluationResponse>();
            try
            {
                var evaluationEntity = new Evaluation
                {
                    SchoolYearId = request.SchoolYearId,
                    ViolationConfigId = request.ViolationConfigId,
                    Description = request.Description,
                    From = request.From,
                    To = request.To,
                    Point = request.Point,
                };

                var created = await _unitOfWork.Evaluation.CreateEvaluation(evaluationEntity);

                response.Data = _mapper.Map<EvaluationResponse>(created);
                response.Message = "Evaluation created successfully";
                response.Success = true;
            }
            catch (Exception ex)
            {
                response.Message = "Create Evaluation failed: " + ex.Message
                    + (ex.InnerException != null ? ex.InnerException.Message : "");
                response.Success = false;
            }
            return response;
        }

        public async Task<DataResponse<EvaluationResponse>> UpdateEvaluation(EvaluationUpdateRequest request)
        {
            var response = new DataResponse<EvaluationResponse>();
            try
            {
                var existingEvaluation = await _unitOfWork.Evaluation.GetEvaluationById(request.EvaluationId);
                if (existingEvaluation == null)
                {
                    response.Data = "Empty";
                    response.Message = "Evaluation not found";
                    response.Success = false;
                    return response;
                }

                existingEvaluation.SchoolYearId = request.SchoolYearId ?? existingEvaluation.SchoolYearId;
                existingEvaluation.ViolationConfigId = request.ViolationConfigId ?? existingEvaluation.ViolationConfigId;
                existingEvaluation.Description = request.Description ?? existingEvaluation.Description;
                existingEvaluation.From = request.From ?? existingEvaluation.From;
                existingEvaluation.To = request.To ?? existingEvaluation.To;
                existingEvaluation.Point = request.Point ?? existingEvaluation.Point;

                await _unitOfWork.Evaluation.UpdateEvaluation(existingEvaluation);

                response.Data = _mapper.Map<EvaluationResponse>(existingEvaluation);
                response.Message = "Evaluation updated successfully";
                response.Success = true;
            }
            catch (Exception ex)
            {
                response.Data = "Empty";
                response.Message = "Update Evaluation failed: " + ex.Message
                    + (ex.InnerException != null ? ex.InnerException.Message : "");
                response.Success = false;
            }
            return response;
        }

        public async Task<DataResponse<EvaluationResponse>> DeleteEvaluation(int id)
        {
            var response = new DataResponse<EvaluationResponse>();
            try
            {
                var evaluation = _unitOfWork.Evaluation.GetById(id);
                if (evaluation is null)
                {
                    response.Data = "Empty";
                    response.Message = "Cannot find Evaluation with ID: " + id;
                    response.Success = false;
                    return response;
                }

                _unitOfWork.Evaluation.Remove(evaluation);
                _unitOfWork.Save();

                response.Data = "Empty";
                response.Message = "Evaluation deleted successfully";
                response.Success = true;
            }
            catch (Exception ex)
            {
                response.Message = "Delete Evaluation failed: " + ex.Message
                    + (ex.InnerException != null ? ex.InnerException.Message : "");
                response.Success = false;
            }
            return response;
        }

        public async Task<DataResponse<List<EvaluationResponse>>> GetEvaluationsBySchoolId(int schoolId)
        {
            var response = new DataResponse<List<EvaluationResponse>>();
            try
            {
                var evaluations = await _unitOfWork.Evaluation.GetEvaluationsBySchoolId(schoolId);
                if (evaluations == null || !evaluations.Any())
                {
                    response.Message = "No Evaluations found for the specified SchoolId";
                    response.Success = false;
                }
                else
                {
                    var evaluationDTOS = _mapper.Map<List<EvaluationResponse>>(evaluations);
                    response.Data = evaluationDTOS;
                    response.Message = "Evaluations found";
                    response.Success = true;
                }
            }
            catch (Exception ex)
            {
                response.Message = "Oops! Something went wrong.\n" + ex.Message;
                response.Success = false;
            }
            return response;
        }
    }
}
