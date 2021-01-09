# %%
import subprocess
import proxy
# subprocess.check_call("export https_proxy=http://127.0.0.1:1080", shell = True)
# subprocess.check_call("export https_proxys=http://127.0.0.1:1080", shell = True)

proxy.set_proxy()
res = subprocess.check_output("geeadd quota --project projects/pml_evapotranspiration", shell=True)
print(res)
# for i in range(0, 2):
#     for j in range(0, 1):
#         file = "LAI_2016_2020_%d_%d" % (i, j)
#         outdir = "projects/pml_evapotranspiration/PML_INPUTS/MODIS/LAI_Terra_Whittaker_v010"
#         cmd = "geeadd move --initial projects/pml_evapotranspiration/PML_INPUTS/LAI_Terra_Whittaker_v011/%s --final %s/%s" % (file, outdir, file)
#         print(cmd)
#         subprocess.check_output(cmd, shell=True)
