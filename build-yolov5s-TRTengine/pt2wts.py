import torch
import struct
from utils.torch_utils import select_device
import argparse

parser = argparse.ArgumentParser()
parser.add_argument(
        "--pt", 
        default= './best.pt',
        help = ".pt file to covert to .wts )",
    )

args, _ = parser.parse_known_args()


# Initialize
device = select_device('cpu')
# Load model
model = torch.load(args.pt, map_location=device)['model'].float()  # load to FP32
model.to(device).eval()
wts_file=args.pt[:-3]+".wts"
print("creating: ", wts_file)
f = open(wts_file, 'w')
f.write('{}\n'.format(len(model.state_dict().keys())))
for k, v in model.state_dict().items():
    vr = v.reshape(-1).cpu().numpy()
    f.write('{} {} '.format(k, len(vr)))
    for vv in vr:
        f.write(' ')
        f.write(struct.pack('>f',float(vv)).hex())
    f.write('\n')

print( wts_file, " build succesfully")