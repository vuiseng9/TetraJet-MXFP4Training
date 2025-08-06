### vs-context
This is where we capture all related environment, branch and results

1. ootb train (250725-reproduce), log: https://github.com/vuiseng9/TetraJet-MXFP4Training/blob/250725-reproduce/scripts/Pretrain-TetraJet/log.2025-07-25_20-05-33.pretrain-deit_tiny
2. first run with fp4tk (250727-use-fp4tk), log: https://github.com/vuiseng9/TetraJet-MXFP4Training/blob/250727-use-fp4tk/scripts/Pretrain-TetraJet/log.2025-07-28_00-53-46.pretrain-deit_tiny
3. second run post implementation fix (250806-use-fp4tk)

> pls push log to each branch after each completed run, they are saved in volume which will be deleted in future (because it is not free)
### Environments
```
Official environment
- `CUDA==11.7`, `Python>=3.8`
- `triton==3.0.0`
- `torch==1.13.1+cu117`, `torchaudio==0.13.1+cu117`, `torchvision==0.14.1+cu117`
- `numpy`, 

`nvidia-pyindex`, `nvidia-dllogger`, `tensorboardX`
```
```
# Local interactive build (worked)
python 3.12
cuda 12.6

torch==2.7.1
torchaudio==2.7.1
torchvision==0.22.1

triton==3.3.1

numpy==2.3.1

nvidia-pyindex==1.0.9
nvidia-dllogger==0.1.0

tensorboardX==2.6.4
```

```
Standardized Cloud Process

hyperstack A4000x4
update cuda driver to 12.6

nw-conda-env sf-250806-tt-fp4tk-run2 (cuda 12.6, 3.12)
install-torch 126

$ pip freeze | grep "torch\|triton\|numpy"
numpy==2.1.2
torch==2.8.0+cu126
torchaudio==2.8.0+cu126
torchvision==0.23.0+cu126
triton==3.4.0

pip install tensorboardX
pip install nvidia-pyindex 
pip install nvidia-dllogger

# TetraJet-MXFP4Training (250806-use-fp4tk) commit f52ab93d07f7
# fp4tk (main) commit 379397f0 : Modify matmul.py to support autocast

   git clone https://github.com/vuiseng9/fp4-trainkit
   cd fp4-trainkit/
   pip install -e .

# review train script
nohup ./pretrain-deit_tiny.sh &
```
