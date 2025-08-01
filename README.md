# 🛠 Config Sync
이 저장소는 VSCode, PowerToys 등 다양한 앱의 설정 파일을 한 곳에서 관리하고, 
다른 PC에서도 쉽게 동기화할 수 있도록 도와주는 간단한 배치 툴입니다.

## 🔧 구성 요소
- `configs/`: 실제 설정 파일들
- `mappings.json`: 설정 파일 → 복사 대상 경로 정보
- `sync.bat`: 동기화 실행
- `backup.ps1`: 현재 설정 파일들을 백업하는 스크립트

## 🚀 사용법

1. 이 저장소를 클론
2. `sync.bat` 실행하여 설정 동기화
3. 필요 시 `backup.ps1` 실행하여 현재 설정 상태를 백업
   - 백업은 `backup/날짜_시간/` 폴더에 저장되며, 사용 중이던 `mappings.json`도 함께 포함됩니다