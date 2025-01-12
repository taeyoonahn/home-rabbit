import 'package:flutter/material.dart';
import 'package:home_rabbit/domain/use_case/use_cases.dart';
import 'package:home_rabbit/presentation/widget/item/discrimintaion_result_detail_item.dart';

class SystemInfoViewModel with ChangeNotifier {
  final UseCases useCases;
  String? _currentRiskFactor;
  String? get currentRiskFactor => _currentRiskFactor;
  setCurrentRiskFactor(String currentRiskFactor){
    _currentRiskFactor = currentRiskFactor;
    notifyListeners();
  }
  String? _currentQuestionInfoFactor;
  String? get currentQuestionInfoFactor => _currentQuestionInfoFactor;
  setCurrentQuestionInfoFactor(String currentQuestionInfoFactor){
    _currentQuestionInfoFactor = currentQuestionInfoFactor;
    notifyListeners();
  }
  String? _currentSystemUserInfoFactor;
  String? get currentSystemUserInfoFactor => _currentSystemUserInfoFactor;
  setCurrentSystemUserInfoFactor(String currentSystemUserInfoFactor){
    _currentSystemUserInfoFactor = currentSystemUserInfoFactor;
    notifyListeners();
  }

  List<String> doubleAgentContractResultDetailString = [];
  List<String> duplicateContractResultDetailString = [];
  List<String> financialRiskResultDetailString = [];
  List<String> illegalBuildingResultDetailString = [];
  List<String> noInsuranceResultDetailString = [];
  List<String> realEstateAgentScamResultDetailString = [];
  List<String> taxEvasionResultDetailString = [];
  List<String> trustCompanyResultDetailString = [];

  List<Widget> doubleAgentContractResultDetail = [];
  List<Widget> duplicateContractResultDetail = [];
  List<Widget> financialRiskResultDetail = [];
  List<Widget> illegalBuildingResultDetail = [];
  List<Widget> noInsuranceResultDetail = [];
  List<Widget> realEstateAgentScamResultDetail = [];
  List<Widget> taxEvasionResultDetail = [];
  List<Widget> trustCompanyResultDetail = [];

  SystemInfoViewModel(this.useCases);

  Future<void> fetchResultInfoTexts() async {
    doubleAgentContractResultDetailString =
    await useCases.getResultInfoTextsUseCase('doubleAgentContract');
    doubleAgentContractResultDetail = doubleAgentContractResultDetailString
        .map((str) => DiscriminationResultDetailItem(
      resultInfoText: str,
    ))
        .toList();
    duplicateContractResultDetailString =
    await useCases.getResultInfoTextsUseCase('duplicateContract');
    duplicateContractResultDetail = duplicateContractResultDetailString
        .map((str) => DiscriminationResultDetailItem(
      resultInfoText: str,
    ))
        .toList();
    financialRiskResultDetailString =
    await useCases.getResultInfoTextsUseCase('financialRisk');
    financialRiskResultDetail = financialRiskResultDetailString
        .map((str) => DiscriminationResultDetailItem(
      resultInfoText: str,
    ))
        .toList();
    illegalBuildingResultDetailString =
    await useCases.getResultInfoTextsUseCase('illegalBuilding');
    illegalBuildingResultDetail = illegalBuildingResultDetailString
        .map((str) => DiscriminationResultDetailItem(
      resultInfoText: str,
    ))
        .toList();
    noInsuranceResultDetailString =
    await useCases.getResultInfoTextsUseCase('noInsurance');
    noInsuranceResultDetail = noInsuranceResultDetailString
        .map((str) => DiscriminationResultDetailItem(
      resultInfoText: str,
    ))
        .toList();
    realEstateAgentScamResultDetailString =
    await useCases.getResultInfoTextsUseCase('realEstateAgentScam');
    realEstateAgentScamResultDetail = realEstateAgentScamResultDetailString
        .map((str) => DiscriminationResultDetailItem(
      resultInfoText: str,
    ))
        .toList();
    taxEvasionResultDetailString =
    await useCases.getResultInfoTextsUseCase('taxEvasionResultDetail');
    taxEvasionResultDetail = taxEvasionResultDetailString
        .map((str) => DiscriminationResultDetailItem(
      resultInfoText: str,
    ))
        .toList();
    trustCompanyResultDetailString =
    await useCases.getResultInfoTextsUseCase('trustCompany');
    trustCompanyResultDetail = trustCompanyResultDetailString
        .map((str) => DiscriminationResultDetailItem(
      resultInfoText: str,
    ))
        .toList();
  }

  List<Widget> getCurrentResultDetail() {
    switch (currentRiskFactor) {
      case '대리인 이중계약':
        return doubleAgentContractResultDetail;
      case '동일매물 중복계약':
        return duplicateContractResultDetail;
      case '재무적 위험':
        return financialRiskResultDetail;
      case '불법 건축물':
        return illegalBuildingResultDetail;
      case '보험 가입 불가':
        return noInsuranceResultDetail;
      case '공인중개사 신뢰 불가':
        return realEstateAgentScamResultDetail;
      case '세금 체납':
        return taxEvasionResultDetail;
      case '신탁 거래':
        return trustCompanyResultDetail;
      default:
        return [];
    }
  }

  String getCurrentQuestionInfoUrl() {
    switch (currentQuestionInfoFactor) {
      case '대리인 이중계약':
        return 'https://upbeat-double-f6b.notion.site/3fd815cac9224ded961f025dd6d944b4';
      case '동일매물 중복계약':
        return 'https://upbeat-double-f6b.notion.site/22877b6e6ce64de5910935d8f9f2e800';
      case '불법 건축물':
        return 'https://upbeat-double-f6b.notion.site/494ab36793f544fc9fa9652a7ccba2f1';
      case '보험 가입 불가':
        return 'https://upbeat-double-f6b.notion.site/c1c9e42d476a4e4a99b8c17f2e5bca69';
      case '공인중개사 신뢰 불가':
        return 'https://upbeat-double-f6b.notion.site/d6e904f671aa46c5b7ec5da9989bc0dd';
      case '세금 체납':
        return 'https://upbeat-double-f6b.notion.site/76ac1fa521324c72993637996c72852e';
      case '신탁 거래':
        return 'https://upbeat-double-f6b.notion.site/13255560434c45b2ae4a90574bc8db11';
      case '매물 시세':
        return 'https://upbeat-double-f6b.notion.site/87a5663f029b47489e2c696e91c30fdd';
      case '근저당권':
        return 'https://upbeat-double-f6b.notion.site/b4d59514e8b94b409b573e00993eb26d';
      case '선순위 보증금':
        return 'https://upbeat-double-f6b.notion.site/25bd67fc45e54141ae4b226afde55492';
      case '전세보증금액':
        return 'https://upbeat-double-f6b.notion.site/f7f5d9401539408d98276f64e6c4370b';
      case '최우선 변제금액':
        return 'https://upbeat-double-f6b.notion.site/ba0e527d2f064b7695ff4fe582f1e7ea';
      default:
        return '';
    }
  }

  String getCurrentSystemUserInfoUrl() {
    switch (currentSystemUserInfoFactor) {
      case '서비스 약관':
        return 'https://upbeat-double-f6b.notion.site/133c0755d3c780d196bdca0c239bd1cb?pvs=74';
      case '개인정보 처리방침':
        return 'https://upbeat-double-f6b.notion.site/133c0755d3c780f7b59edc8ad1bc672d?pvs=74';
      default:
        return '';
    }
  }

  String getNotificationInfoUrl() {
    return 'https://upbeat-double-f6b.notion.site/133c0755d3c780d196bdca0c239bd1cb?pvs=74';
  }
}
