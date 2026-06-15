# Care Pathway — Care Pathway

**Clinical Question**: What clinical phases, sequencing, and transitions organize neoadjuvant therapy decisions for nonmetastatic breast cancer?


## Pathway Tree

```text
Neoadjuvant breast cancer treatment pathway
    |-- Candidacy and treatment intent
    |   |-- Establish neoadjuvant candidacy
    |   `-- Review standard tumor features
    |-- Subtype-directed regimen planning
    |   |-- Plan TNBC therapy
    |   |-- Plan HR-positive HER2-negative therapy
    |   `-- Plan HER2-positive therapy
    `-- Monitoring and response assessment
        `-- Assess treatment response
```

## Steps

| Step | Description | Actor | Parent |
|------|-------------|-------|--------|
| Neoadjuvant breast cancer treatment pathway | Overall pathway for evaluating, selecting, and monitoring neoadjuvant systemic therapy in invasive nonmetastatic breast cancer. | multidisciplinary oncology team | - |
| Candidacy and treatment intent | Determine whether neoadjuvant therapy is indicated and what clinical goal it serves. | multidisciplinary oncology team | neoadjuvant-breast-cancer-pathway |
| Establish neoadjuvant candidacy | Review inflammatory or locally advanced presentation, residual-disease driven adjuvant planning, downstaging goals, and surgery delay scenarios. | multidisciplinary oncology team | candidacy-phase |
| Review standard tumor features | Use histology, grade, stage, and receptor status to anchor treatment planning and avoid unsupported markers. | medical oncologist | candidacy-phase |
| Subtype-directed regimen planning | Select a neoadjuvant regimen according to biologic subtype and clinical risk. | medical oncologist | neoadjuvant-breast-cancer-pathway |
| Plan TNBC therapy | Choose anthracycline taxane chemotherapy, decide on carboplatin, and avoid routine immune checkpoint inhibitor use or low-stage overtreatment. | medical oncologist | subtype-planning-phase |
| Plan HR-positive HER2-negative therapy | Decide whether chemotherapy can be selected without surgical pathology and whether endocrine downstaging is appropriate. | medical oncologist | subtype-planning-phase |
| Plan HER2-positive therapy | Choose trastuzumab-based neoadjuvant therapy for high-risk disease and avoid routine use in small node-negative disease. | medical oncologist | subtype-planning-phase |
| Monitoring and response assessment | Monitor the patient during therapy and use response findings to guide ongoing decisions. | medical oncologist | neoadjuvant-breast-cancer-pathway |
| Assess treatment response | Use regular clinical examination, selective imaging, and pathologic complete response rather than blood or tissue biomarkers. | medical oncologist | monitoring-phase |

## Rule Links

| Step | Rule ID | Action Labels |
|------|---------|---------------|
| Neoadjuvant breast cancer treatment pathway | - | - |
| Candidacy and treatment intent | - | - |
| Establish neoadjuvant candidacy | - | Coordinate multidisciplinary neoadjuvant management, Offer neoadjuvant chemotherapy for inflammatory or locally advanced disease, Offer neoadjuvant systemic therapy when residual disease will guide adjuvant planning, Offer neoadjuvant systemic therapy to reduce surgery extent, Offer neoadjuvant systemic therapy when surgery is delayed |
| Review standard tumor features | rule-r1-2-standard-features | Use histology grade stage and receptor status to guide decisions, Do not rely on other biomarkers or genomic profiles for neoadjuvant decision-making |
| Subtype-directed regimen planning | - | - |
| Plan TNBC therapy | - | Offer anthracycline and taxane regimen for eligible TNBC, Do not routinely offer neoadjuvant therapy for cT1a or cT1b N0 TNBC, Consider carboplatin to increase pathologic complete response, Do not routinely add immune checkpoint inhibitors to neoadjuvant chemotherapy |
| Plan HR-positive HER2-negative therapy | - | Use neoadjuvant chemotherapy when the chemotherapy decision does not require surgical data, Offer aromatase inhibitor based neoadjuvant endocrine therapy for postmenopausal downstaging, Use endocrine therapy for disease control when surgery is not planned, Do not routinely offer neoadjuvant endocrine therapy to premenopausal patients |
| Plan HER2-positive therapy | - | Offer trastuzumab-based neoadjuvant therapy for high-risk HER2-positive disease, Consider pertuzumab with trastuzumab, Do not routinely offer neoadjuvant chemotherapy or anti-HER2 therapy for T1a or T1b N0 HER2-positive disease |
| Monitoring and response assessment | - | - |
| Assess treatment response | - | Monitor response with regular clinical examination, Use the most informative baseline imaging modality when imaging is needed, Do not use blood or tissue biomarkers for monitoring, Use pathologic complete response to guide decision-making |

## Transitions

| From | To | Condition | Description |
|------|----|-----------|-------------|
| Candidacy and treatment intent | Subtype-directed regimen planning | - | Proceed to subtype-directed regimen selection after neoadjuvant candidacy is established. |
| Subtype-directed regimen planning | Monitoring and response assessment | - | Begin ongoing monitoring after a subtype-specific neoadjuvant regimen is selected. |

