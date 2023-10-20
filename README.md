![image](https://github.com/SimJaeHyeok/ios-contact-manager-ui/assets/142188004/f77ff91e-0701-4329-92b0-de1408fc6dd3)







### 프로젝트 참여자 🤝

| <img src="https://avatars.githubusercontent.com/u/142188004?v=4" width="90" height="90"> | <img src="https://avatars.githubusercontent.com/u/68066104?v=4" width="90" height="90"> |
| ----------- | --------- |
| [@SimJaeHyeok](https://github.com/SimJaeHyeok) | [@KSK9820](https://github.com/KSK9820) |
| JaeHyeok | Dora |

### 앱 실행화면 📱
---
- 메인 화면
</br>  <img src="https://github.com/SimJaeHyeok/ios-contact-manager-ui/assets/142188004/755da946-9a48-4818-909b-5dd58c3a910b" width="330" height="716">

- 연락처 추가
</br> ![addContect](https://github.com/SimJaeHyeok/ios-contact-manager-ui/assets/142188004/4be2aa34-2254-4bc9-8a0d-daa2b25abd24)

- 입력 오류 상황
</br>![error](https://github.com/SimJaeHyeok/ios-contact-manager-ui/assets/142188004/df1da2bc-6583-47f7-b7ff-db861d5e87cd)

- 삭제 기능
</br> ![delete](https://github.com/SimJaeHyeok/ios-contact-manager-ui/assets/142188004/204360dc-a931-47de-96b2-af0947eec9a4)

- 검색 기능
</br> ![search](https://github.com/SimJaeHyeok/ios-contact-manager-ui/assets/142188004/7b365a9a-da54-4b3a-9467-e14f9fb61f67)


### 앱 소개 & 기능 설명 🧾
---
- 연락처(이름, 나이, 번호)를 관리하는 앱
- Model
    
    ```swift
    struct Contact {
    	var name: String
    	var phoneNumber: String
    	var age: Int
    }
    ```
  - Model의 로직 내부에서 보기, 추가, 삭제, 검색 기능을 구현
- ViewController
  - ViewController: 연락처 보기, 검색, 삭제 기능이 동작
  - NewContactViewController: 연락처를 추가하면 뜨는 modal
---
### UML ⚙️
![image](https://github.com/SimJaeHyeok/ios-contact-manager-ui/assets/142188004/efa064c5-1739-4e28-864f-55dfc55c9a6a)

### 트러블 슈팅(추구하고자 했던 방향과 오류 그리고 알게된 점) ⛳️
---

- 유용한 데이터 모델은 무엇일까?
  - 배열(Array)
      - 단순한 구조와 연속된 메모리 공간으로 메모리 사용 측면에서 효율적이다.
      - 인덱스를 찾기 쉽다.
  - 연결 리스트(linked List)
      - 원소들이 연결되어 있어서 삽입 및 삭제 작업이 중간에서 효율적이고, 크기가 자주 변경하는데 유용하다.
      - O(1) 시간복잡도를 가진다.
      - 하지만 인덱스를 찾는데 O(n)의 시간이 걸린다.
  
      ⇒ 연결 리스트는 주로  상황에서 유용하며, 연락처 앱에서는 삽입 및 삭제 연산이 빈번하게 발생하는 경우가 많지 않기 때문에 단순한 구조와 연속된 메모리 공간으로 메모리 사용 측면에서 효율적인 배열을 선택하였습니다.
  
- 2차원 배열은 삽입, 삭제의 오버헤드를 줄일 수 있을까?
  - 2차원 배열의 형태: [A, B, C, [Dora, Dorae], …, [JaeHyeok], … ,Z]
      - 1차원 배열을 A to Z 인덱스로 사용하고, 이름의 첫 글자를 기준으로 2차원 배열에 삽입하는 형태를 사용여 해당되는 2차원 배열에서만 삽입, 삭제 연산을 하여 오버헤드를 줄이고자 하였다.
      - 하지만 2차원 배열도 메모리가 연속되어 있다는 것을 알게되었다.
      - 2차원 배열은 메모리가 연속되어 있기 때문에 중간에 삽입을 하면 전체가 재할당되는 오버헤드를 피할 수 없습니다. 따라서 2차원 배열은 단순히 색인의 역할만을 한다.
  
    ⇒ 단순한 구조와 연속된 메모리 공간의 이점을 활용하기 위해서 1차원 배열로 구조를 변경하였습니다.
  
- 테이블 뷰에 연락처를 추가하고 삭제할 때 전체를 새로 불러오는 reloadData보다 더 성능에 좋은 방법은 무엇일까? - deleteRows와 reloadRows는 무슨 차이가 있을까?
  - deleteRows
      - 실제 데이터를 수정하고 deleteRows를 호출하면 데이터 소스는 업데이트 이전과 이후의 섹션의 행의 개수를 비교하고, delete -1의 move out -1과 같은 결과 값이 나온다면 뷰를 리로드 한다.
  - reloadRows
      - 실제 데이터를 수정하고 deleteRows를 호출하면 데이터 소스는 업데이트 이전과 이후의 섹션의 행의 개수가 같은 값이 나온다면 뷰를 리로드 한다.
  
    ⇒ 삭제하고 tableview를 리로드할 때는 deleteRows를 사용해야한다. 
  
  - 실제 데이터와 tableview의 데이터 소스의 sync를 맞추기 위해서 defer문 내부에 deleteRows를 실행한다.










