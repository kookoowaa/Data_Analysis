# 기여도 분석, CTC<sup>Contribution to Change</sup>

- 두개의 % 비교군 간에 변동이 있을 경우, 원인이 구성비에 있는지, %변동에 있는지 살펴보기 위한 분석 기법

- 예를 들어 전체 영업이익률의 변동이 (예 +2%) 있을 경우, 사업부 구성비의 변동이(A사업부의 매출비중이 -3%) 미치는 영향도와, 각 사업부의 영업이익률의 변동이(B사업부의 매출이익이 +7%p) 미치는 영향도를 분리해서 살펴보는 방법

- 이 같은 분석 기법은, 목표 대비 미달/초과 원인을 분석하는데에도 용이할 뿐 아니라, YoY, QoQ 등 기간에 걸쳐 일어나는 변화를 추적하기에도 용이함

- 

## CTC 구성

- %에 대한 CTC의 구성은 다음과 같이 CTC Mix와 CTC rate impact로 나눠서 볼 수 있음
  $\%variance = \sum_i^n CTC_i = \sum_i^n CTC\_Mix_i + \sum_i^nCTC\_Rate_i$



- 이 중 $CTC\_Mix$는 1) 구성 내 %편차를 고정으로 두고 **2) 구성비의 변화가 미치는 영향도**를 분석해주게 됨

- 이를 위한 수식은 다음과 같은 로직으로 전개해 나아감:
  
  >  $CTC\_Mix_i = delta\_in\_Baseline\%_i * (Comparison\_Share_i - Baseline\_share_i) $
  > 
  > - where for the case of revenue and margin(%):
  > 
  > $delta\_in\_Baseline\%_i = Baseline\_Margin_i - (\sum_i^n Baseline\_Profit_i / \sum_i^n Baseline\_Revenue_i)$
  > 
  > $Comparison\_Share_i = Comparison\_Revenue_i / \sum_i^n Comparison\_Revenue_i$
  > 
  > $Baseline\_Share_i = Baseline\_Revenue_i / \sum_i^n Baseline\_Revenue_i$



- $CTC\_Rate$의 경우는 1) 구성비를 고정으로 두고 **2) %의 변화가 미치는 영향도**를 분석

- 이를 수식으로 나타내면 다음과 같음:
  
  > $CTC\_Rate_i = Comparison\_Share_i * delta\_in\_\%_i$
  > 
  > - where for the case of revenue and margin(%):
  > 
  > $Comparison\_Share_i = Comparison\_Revenue\_i / \sum_i^n Comparison\_Revenue_i$
  > 
  > $delta\_in\_\%_i = Comparion\_Margin_i - Baseline\_Margin_i$




