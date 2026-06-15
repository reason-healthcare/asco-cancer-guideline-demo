# Decision Table — Decision Table

**Clinical Question**: What recommendation-scoped triggers, local conditions, and actions form the decision logic?
**Derived From**: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf

## Summary

ASCO guidance organizes neoadjuvant therapy decisions around candidate selection, subtype-directed regimen planning, and treatment response monitoring for invasive nonmetastatic breast cancer.

## Event Tree

```text
Event: Assess neoadjuvant candidacy [trigger: initial-breast-cancer-treatment-planning]
|   |-- Rule: rule-multidisciplinary-management
|   |   `-- Then
|   |       `-- coordinate-multidisciplinary-management Coordinate multidisciplinary neoadjuvant management
|   |-- Rule: rule-r1-1-advanced-disease
|   |   |-- When: Inflammatory or locally advanced unresectable disease = Yes
|   |   `-- Then
|   |       `-- offer-neoadjuvant-chemotherapy-for-advanced-disease Offer neoadjuvant chemotherapy for inflammatory or locally advanced disease
|   |-- Rule: rule-r1-2-standard-features
|   |   |-- When: Histology grade stage and ER PR HER2 are available = Yes
|   |   `-- Then
|   |       |-- use-standard-tumor-features Use histology grade stage and receptor status to guide decisions
|   |       `-- avoid-other-markers Do not rely on other biomarkers or genomic profiles for neoadjuvant decision-making
|   |-- Rule: rule-r1-3-residual-disease-guided
|   |   |-- When: Residual disease result would change adjuvant therapy = Yes
|   |   `-- Then
|   |       `-- offer-neoadjuvant-for-residual-disease-guided-adjuvant-planning Offer neoadjuvant systemic therapy when residual disease will guide adjuvant planning
|   |-- Rule: rule-r1-4-downstaging
|   |   |-- When: Downstaging or surgery extent reduction is a treatment goal = Yes
|   |   `-- Then
|   |       `-- offer-neoadjuvant-for-downstaging Offer neoadjuvant systemic therapy to reduce surgery extent
|   `-- Rule: rule-r1-5-surgery-delay
|       |-- When: Surgery delay is preferable or unavoidable = Yes
|       `-- Then
|           `-- offer-neoadjuvant-for-surgery-delay Offer neoadjuvant systemic therapy when surgery is delayed
Event: Monitor treatment response [trigger: active-neoadjuvant-treatment-course]
|   |-- Rule: rule-r2-1-monitoring
|   |   `-- Then
|   |       |-- monitor-with-clinical-examination Monitor response with regular clinical examination
|   |       `-- use-baseline-informative-imaging Use the most informative baseline imaging modality when imaging is needed
|   |-- Rule: rule-r2-2-no-biomarkers
|   |   `-- Then
|   |       `-- avoid-blood-and-tissue-biomarker-monitoring Do not use blood or tissue biomarkers for monitoring
|   `-- Rule: rule-r2-3-use-pcr
|       `-- Then
|           `-- use-pcr-to-guide-decisions Use pathologic complete response to guide decision-making
Event: Select TNBC neoadjuvant regimen [trigger: tnbc-subtype-treatment-selection]
|   |-- Rule: rule-r3-1-tnbc-eligible
|   |   |-- When: TNBC is node-positive or at least T1c = Yes
|   |   `-- Then
|   |       `-- offer-anthracycline-taxane-for-tnbc Offer anthracycline and taxane regimen for eligible TNBC
|   |-- Rule: rule-r3-2-tnbc-small-node-negative
|   |   |-- When: TNBC is cT1a or cT1b N0 = Yes
|   |   `-- Then
|   |       `-- avoid-neoadjuvant-therapy-for-small-tnbc Do not routinely offer neoadjuvant therapy for cT1a or cT1b N0 TNBC
|   |-- Rule: rule-r3-3-carboplatin
|   |   |-- When: TNBC is node-positive or at least T1c = Yes
|   |   |-- When: Benefit harm balance favors carboplatin = Yes
|   |   `-- Then
|   |       `-- consider-carboplatin-for-tnbc Consider carboplatin to increase pathologic complete response
|   `-- Rule: rule-r3-4-no-ici
|       `-- Then
|           `-- avoid-routine-immune-checkpoint-inhibitors Do not routinely add immune checkpoint inhibitors to neoadjuvant chemotherapy
Event: Select HR-positive HER2-negative strategy [trigger: hr-positive-her2-negative-treatment-selection]
|   |-- Rule: rule-r4-1-use-chemo
|   |   |-- When: HR-positive HER2-negative subtype = Yes
|   |   |-- When: Chemotherapy decision can be made without surgical pathology or genomic testing = Yes
|   |   `-- Then
|   |       `-- use-neoadjuvant-chemotherapy-without-surgical-data Use neoadjuvant chemotherapy when the chemotherapy decision does not require surgical data
|   |-- Rule: rule-r4-2-postmenopausal-endocrine
|   |   |-- When: HR-positive HER2-negative subtype = Yes
|   |   |-- When: Patient is postmenopausal = Yes
|   |   `-- Then
|   |       `-- offer-postmenopausal-neoadjuvant-endocrine-therapy Offer aromatase inhibitor based neoadjuvant endocrine therapy for postmenopausal downstaging
|   |-- Rule: rule-r4-2-no-surgery
|   |   |-- When: HR-positive HER2-negative subtype = Yes
|   |   |-- When: No surgery is intended = Yes
|   |   `-- Then
|   |       `-- use-endocrine-therapy-for-disease-control Use endocrine therapy for disease control when surgery is not planned
|   `-- Rule: rule-r4-3-premenopausal
|       |-- When: HR-positive HER2-negative subtype = Yes
|       |-- When: Patient is premenopausal = Yes
|       `-- Then
|           `-- avoid-premenopausal-neoadjuvant-endocrine-therapy Do not routinely offer neoadjuvant endocrine therapy to premenopausal patients
Event: Select HER2-positive neoadjuvant regimen [trigger: her2-positive-treatment-selection]
    |-- Rule: rule-r5-1-her2-high-risk
    |   |-- When: HER2-positive with node-positive or high-risk node-negative disease = Yes
    |   `-- Then
    |       |-- offer-her2-directed-neoadjuvant-regimen Offer trastuzumab-based neoadjuvant therapy for high-risk HER2-positive disease
    |       `-- consider-pertuzumab-with-trastuzumab Consider pertuzumab with trastuzumab
    `-- Rule: rule-r5-2-small-her2-positive
        |-- When: HER2-positive T1a or T1b N0 disease = Yes
        `-- Then
            `-- avoid-neoadjuvant-therapy-for-small-her2-positive Do not routinely offer neoadjuvant chemotherapy or anti-HER2 therapy for T1a or T1b N0 HER2-positive disease
```

## Features And Data Elements

| Condition | Data Element | Type | Description |
|---|---|---|---|
| inflammatory-or-locally-advanced Inflammatory or locally advanced unresectable disease | de-inflammatory-stage Clinical stage and resectability assessment | diagnosis | Review inflammatory presentation, local extent, and initial surgical resectability. |
| residual-disease-would-change-adjuvant-therapy Residual disease result would change adjuvant therapy | de-residual-disease-impact Potential adjuvant treatment change | assessment | Determine whether residual disease findings would alter adjuvant treatment recommendations. |
| local-therapy-downstaging-goal Downstaging or surgery extent reduction is a treatment goal | de-local-therapy-goal Local therapy reduction goal | patient-reported | Document whether the intent is to increase breast conservation or reduce axillary surgery. |
| surgery-delay-context Surgery delay is preferable or unavoidable | de-surgery-delay Surgical timing constraints | history | Document decision-making, testing, or reconstruction factors that justify delay in surgery. |
| standard-tumor-features-available Histology grade stage and ER PR HER2 are available | de-standard-features Standard tumor biology features | assessment | Review histology, grade, stage, estrogen receptor, progesterone receptor, and HER2 status. |
| tnbc-node-positive-or-t1c-plus TNBC is node-positive or at least T1c | de-tnbc-stage TNBC nodal and tumor stage | diagnosis | Confirm node-positive status and whether disease is at least T1c. |
| tnbc-ct1ab-n0 TNBC is cT1a or cT1b N0 | de-tnbc-small-node-negative Small node-negative TNBC status | diagnosis | Confirm cT1a or cT1b N0 triple-negative breast cancer. |
| benefit-harm-favors-carboplatin Benefit harm balance favors carboplatin | de-carboplatin-risk-benefit Carboplatin risk benefit review | assessment | Assess expected pCR benefit against toxicity and patient tolerance. |
| hr-positive-her2-negative-disease HR-positive HER2-negative subtype | de-hr-her2-subtype HR-positive HER2-negative subtype confirmation | diagnosis | Confirm hormone receptor positivity and HER2 negativity. |
| chemo-decision-without-surgical-data Chemotherapy decision can be made without surgical pathology or genomic testing | de-chemo-decision-context Need for surgical pathology or genomic data | history | Determine whether chemotherapy selection can be made before surgery and genomic profiling. |
| postmenopausal Patient is postmenopausal | de-menopausal-status Menopausal status | history | Determine whether the patient is postmenopausal. |
| no-surgery-intended No surgery is intended | de-surgery-intent Surgical intent | history | Determine whether surgery is planned after systemic therapy. |
| premenopausal Patient is premenopausal | de-premenopausal-status Premenopausal status | history | Determine whether the patient is premenopausal. |
| her2-positive-high-risk HER2-positive with node-positive or high-risk node-negative disease | de-her2-risk HER2-positive risk category | diagnosis | Confirm node-positive disease or high-risk node-negative status in HER2-positive cancer. |
| her2-t1ab-n0 HER2-positive T1a or T1b N0 disease | de-her2-small-node-negative Small node-negative HER2-positive disease | diagnosis | Confirm T1a or T1b N0 HER2-positive disease. |

## Rules

| Event Pattern | inflammatory-or-locally-advanced Inflammatory or locally advanced unresectable disease | residual-disease-would-change-adjuvant-therapy Residual disease result would change adjuvant therapy | local-therapy-downstaging-goal Downstaging or surgery extent reduction is a treatment goal | surgery-delay-context Surgery delay is preferable or unavoidable | standard-tumor-features-available Histology grade stage and ER PR HER2 are available | tnbc-node-positive-or-t1c-plus TNBC is node-positive or at least T1c | tnbc-ct1ab-n0 TNBC is cT1a or cT1b N0 | benefit-harm-favors-carboplatin Benefit harm balance favors carboplatin | hr-positive-her2-negative-disease HR-positive HER2-negative subtype | chemo-decision-without-surgical-data Chemotherapy decision can be made without surgical pathology or genomic testing | postmenopausal Patient is postmenopausal | no-surgery-intended No surgery is intended | premenopausal Patient is premenopausal | her2-positive-high-risk HER2-positive with node-positive or high-risk node-negative disease | her2-t1ab-n0 HER2-positive T1a or T1b N0 disease | Actions |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| assess-neoadjuvant-candidacy Assess neoadjuvant candidacy | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | coordinate-multidisciplinary-management Coordinate multidisciplinary neoadjuvant management |
| assess-neoadjuvant-candidacy Assess neoadjuvant candidacy | Yes | - | - | - | - | - | - | - | - | - | - | - | - | - | - | offer-neoadjuvant-chemotherapy-for-advanced-disease Offer neoadjuvant chemotherapy for inflammatory or locally advanced disease |
| assess-neoadjuvant-candidacy Assess neoadjuvant candidacy | - | - | - | - | Yes | - | - | - | - | - | - | - | - | - | - | use-standard-tumor-features Use histology grade stage and receptor status to guide decisions, avoid-other-markers Do not rely on other biomarkers or genomic profiles for neoadjuvant decision-making |
| assess-neoadjuvant-candidacy Assess neoadjuvant candidacy | - | Yes | - | - | - | - | - | - | - | - | - | - | - | - | - | offer-neoadjuvant-for-residual-disease-guided-adjuvant-planning Offer neoadjuvant systemic therapy when residual disease will guide adjuvant planning |
| assess-neoadjuvant-candidacy Assess neoadjuvant candidacy | - | - | Yes | - | - | - | - | - | - | - | - | - | - | - | - | offer-neoadjuvant-for-downstaging Offer neoadjuvant systemic therapy to reduce surgery extent |
| assess-neoadjuvant-candidacy Assess neoadjuvant candidacy | - | - | - | Yes | - | - | - | - | - | - | - | - | - | - | - | offer-neoadjuvant-for-surgery-delay Offer neoadjuvant systemic therapy when surgery is delayed |
| monitor-neoadjuvant-response Monitor treatment response | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | monitor-with-clinical-examination Monitor response with regular clinical examination, use-baseline-informative-imaging Use the most informative baseline imaging modality when imaging is needed |
| monitor-neoadjuvant-response Monitor treatment response | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | avoid-blood-and-tissue-biomarker-monitoring Do not use blood or tissue biomarkers for monitoring |
| monitor-neoadjuvant-response Monitor treatment response | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | use-pcr-to-guide-decisions Use pathologic complete response to guide decision-making |
| select-tnbc-regimen Select TNBC neoadjuvant regimen | - | - | - | - | - | Yes | - | - | - | - | - | - | - | - | - | offer-anthracycline-taxane-for-tnbc Offer anthracycline and taxane regimen for eligible TNBC |
| select-tnbc-regimen Select TNBC neoadjuvant regimen | - | - | - | - | - | - | Yes | - | - | - | - | - | - | - | - | avoid-neoadjuvant-therapy-for-small-tnbc Do not routinely offer neoadjuvant therapy for cT1a or cT1b N0 TNBC |
| select-tnbc-regimen Select TNBC neoadjuvant regimen | - | - | - | - | - | Yes | - | Yes | - | - | - | - | - | - | - | consider-carboplatin-for-tnbc Consider carboplatin to increase pathologic complete response |
| select-tnbc-regimen Select TNBC neoadjuvant regimen | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | avoid-routine-immune-checkpoint-inhibitors Do not routinely add immune checkpoint inhibitors to neoadjuvant chemotherapy |
| select-hr-her2-negative-regimen Select HR-positive HER2-negative strategy | - | - | - | - | - | - | - | - | Yes | Yes | - | - | - | - | - | use-neoadjuvant-chemotherapy-without-surgical-data Use neoadjuvant chemotherapy when the chemotherapy decision does not require surgical data |
| select-hr-her2-negative-regimen Select HR-positive HER2-negative strategy | - | - | - | - | - | - | - | - | Yes | - | Yes | - | - | - | - | offer-postmenopausal-neoadjuvant-endocrine-therapy Offer aromatase inhibitor based neoadjuvant endocrine therapy for postmenopausal downstaging |
| select-hr-her2-negative-regimen Select HR-positive HER2-negative strategy | - | - | - | - | - | - | - | - | Yes | - | - | Yes | - | - | - | use-endocrine-therapy-for-disease-control Use endocrine therapy for disease control when surgery is not planned |
| select-hr-her2-negative-regimen Select HR-positive HER2-negative strategy | - | - | - | - | - | - | - | - | Yes | - | - | - | Yes | - | - | avoid-premenopausal-neoadjuvant-endocrine-therapy Do not routinely offer neoadjuvant endocrine therapy to premenopausal patients |
| select-her2-positive-regimen Select HER2-positive neoadjuvant regimen | - | - | - | - | - | - | - | - | - | - | - | - | - | Yes | - | offer-her2-directed-neoadjuvant-regimen Offer trastuzumab-based neoadjuvant therapy for high-risk HER2-positive disease, consider-pertuzumab-with-trastuzumab Consider pertuzumab with trastuzumab |
| select-her2-positive-regimen Select HER2-positive neoadjuvant regimen | - | - | - | - | - | - | - | - | - | - | - | - | - | - | Yes | avoid-neoadjuvant-therapy-for-small-her2-positive Do not routinely offer neoadjuvant chemotherapy or anti-HER2 therapy for T1a or T1b N0 HER2-positive disease |

## Evidence Traceability

- **claim-general-team**: Patients undergoing neoadjuvant therapy should be managed by a multidisciplinary care team.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: Recommendations summary paragraph before Clinical Question 1
- **claim-r1-1**: Neoadjuvant chemotherapy is the treatment of choice for inflammatory breast cancer or unresectable locally advanced disease that may become resectable.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 1.1
- **claim-r1-2**: Tumor histology, grade, stage, and ER PR HER2 expression should guide neoadjuvant decisions; other markers and genomic profiles should not.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 1.2
- **claim-r1-3**: Offer neoadjuvant systemic therapy to high-risk HER2-positive or triple-negative disease when residual disease would guide adjuvant treatment recommendations.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 1.3
- **claim-r1-4**: Neoadjuvant systemic therapy may be used to reduce the extent of surgery, including increasing breast-conserving options.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 1.4
- **claim-r1-5**: Neoadjuvant systemic therapy may be offered when surgery is delayed for testing, reconstruction planning, or other decision-making needs.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 1.5
- **claim-r2-1**: Monitor response with regular clinical examination and use the most informative baseline imaging modality when imaging is needed.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 2.1
- **claim-r2-2**: Blood-based and tissue-based biomarkers should not be used to monitor response during neoadjuvant therapy.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 2.2
- **claim-r2-3**: Pathologic complete response should be used to guide clinical decision making after neoadjuvant therapy.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 2.3
- **claim-r3-1**: Offer anthracycline- and taxane-containing neoadjuvant therapy for TNBC with node-positive disease or at least T1c disease.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 3.1
- **claim-r3-2**: Do not routinely offer neoadjuvant therapy for cT1a or cT1b N0 TNBC outside a clinical trial.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 3.2
- **claim-r3-3**: Carboplatin may be offered in TNBC to increase the likelihood of pathologic complete response after balancing benefits and harms.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 3.3
- **claim-r3-4**: There is insufficient evidence to recommend routinely adding immune checkpoint inhibitors to neoadjuvant chemotherapy in early-stage TNBC.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 3.4
- **claim-r4-1**: Neoadjuvant chemotherapy can be used in HR-positive HER2-negative disease when the chemotherapy decision can be made without surgical pathology or genomic testing.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 4.1
- **claim-r4-2**: In postmenopausal HR-positive HER2-negative disease, neoadjuvant endocrine therapy with an aromatase inhibitor may increase locoregional treatment options, and endocrine therapy may be used for disease control if surgery is not intended.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 4.2
- **claim-r4-3**: Premenopausal patients with HR-positive HER2-negative early-stage disease should not routinely receive neoadjuvant endocrine therapy outside a clinical trial.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 4.3
- **claim-r5-1**: Offer trastuzumab-based neoadjuvant therapy for node-positive or high-risk node-negative HER2-positive disease, and pertuzumab may be added with trastuzumab.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 5.1
- **claim-r5-2**: Do not routinely offer neoadjuvant chemotherapy or anti-HER2 agents for T1a N0 or T1b N0 HER2-positive disease outside a clinical trial.
  - Source: korde-et-al-2021-neoadjuvant-chemotherapy-endocrine-therapy-and-targeted-therapy-for-breast-cancer-asco-guideline_pdf, Locator: The Bottom Line, Recommendation 5.2
