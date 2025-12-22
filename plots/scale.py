from matplotlib import pyplot as plt
import numpy as np 

from typing import List

def process(filename: str) -> List[float]:
    ts = []
    with open (filename, 'r') as f:
        for line in f:
            line = line.strip()
            if line.endswith(')'):
                t = float(line.split(' ')[-1][1:-2])
                ts.append(t)
    ts.sort()
    return ts 

def plot(
    cdns1: List[float],
    cdns2: List[float],
    cdns3: List[float],

    bind1: List[float],
    bind2: List[float],
    bind3: List[float],

    pdns1: List[float],
    pdns2: List[float],
    pdns3: List[float],

    hdns1: List[float],
    hdns2: List[float],
    hdns3: List[float],
):
    groups = ['CoreDNS', 'Bind 9', 'PowerDNS', 'HickoryDNS']
    median_cdns1 = np.median(cdns1)
    median_cdns2 = np.median(cdns2)
    median_bind1 = np.median(bind1)
    median_bind2 = np.median(bind2)
    median_pdns1 = np.median(pdns1)
    median_pdns2 = np.median(pdns2)
    median_hdns1 = np.median(hdns1)
    median_hdns2 = np.median(hdns2)
    lo_cdns3, hi_cdns3 = cdns3[0], cdns3[1]
    lo_bind3, hi_bind3 = bind3[0], bind3[1]
    lo_pdns3, hi_pdns3 = pdns3[0], pdns3[1]
    lo_hdns3, hi_hdns3 = hdns3[0], hdns3[1]
    
    case1_medians = [median_cdns1, median_bind1, median_pdns1, median_hdns1]
    case2_medians = [median_cdns2, median_bind2, median_pdns2, median_hdns2]
    case3_lo = [lo_cdns3, lo_bind3, lo_pdns3, lo_hdns3]
    case3_hi = [hi_cdns3, hi_bind3, hi_pdns3, hi_hdns3]

    # normalized_1_medians = [case1 / max(case1_medians) for case1 in case1_medians]
    # normalized_2_medians = [case2 / max(case2_medians) for case2 in case2_medians]

    p25_cdns1 = np.percentile(cdns1, 25)
    p75_cdns1 = np.percentile(cdns1, 75)
    p25_cdns2 = np.percentile(cdns2, 25)
    p75_cdns2 = np.percentile(cdns2, 75)

    p25_bind1 = np.percentile(bind1, 25)
    p75_bind1 = np.percentile(bind1, 75)
    p25_bind2 = np.percentile(bind2, 25)
    p75_bind2 = np.percentile(bind2, 75)

    p25_pdns1 = np.percentile(pdns1, 25)
    p75_pdns1 = np.percentile(pdns1, 75)
    p25_pdns2 = np.percentile(pdns2, 25)
    p75_pdns2 = np.percentile(pdns2, 75)

    p25_hdns1 = np.percentile(hdns1, 25)
    p75_hdns1 = np.percentile(hdns1, 75)
    p25_hdns2 = np.percentile(hdns2, 25)
    p75_hdns2 = np.percentile(hdns2, 75)

    case1_p25 = [p25_cdns1, p25_bind1, p25_pdns1, p25_hdns1]
    case1_p75 = [p75_cdns1, p75_bind1, p75_pdns1, p75_hdns1]
    case2_p25 = [p25_cdns2, p25_bind2, p25_pdns2, p25_hdns2]
    case2_p75 = [p75_cdns2, p75_bind2, p75_pdns2, p75_hdns2]

    # Plotting
    bar_width = 0.3
    index = np.arange(4)

    fig, ax = plt.subplots(figsize=(10, 4.5))

    # Plot bars
    bars1 = ax.bar(index - bar_width, case1_medians, bar_width, label='simple', color='#4C72B0')
    bars2 = ax.bar(index, case2_medians, bar_width, label='complex', color='#55A868')
    bars3_lo = ax.bar(index + bar_width, case3_lo, bar_width, label='real (small)', color='#D97705')
    bars3_hi = ax.bar(index + bar_width, case3_hi, bar_width, bottom=case3_lo, label='real (large)', color='#F39C12')  

    # Plot min-25-75-max error bars for each case
    # Lower and upper bounds for error bars should be (median - 25th percentile) and (75th percentile - median)
    ax.errorbar(index - bar_width, case1_medians, 
                yerr=[np.array(case1_medians) - np.array(case1_p25), np.array(case1_p75) - np.array(case1_medians)], 
                fmt='none', color='#1A3E71', capsize=7, elinewidth=3, capthick=2)  # error bar color similar to bar color

    ax.errorbar(index, case2_medians, 
                yerr=[np.array(case2_medians) - np.array(case2_p25), np.array(case2_p75) - np.array(case2_medians)], 
                fmt='none', color='#2A7F3D', capsize=7, elinewidth=3, capthick=2)  # error bar color similar to bar color

    # Adding text (75th percentile value) on each bar
    for i, (bar1, bar2, p75_1, p75_2) in enumerate(zip(bars1, bars2, case1_p75, case2_p75)):
        # For Case 1 bars
        ax.text(bar1.get_x() + bar1.get_width()/2, p75_1 + 0.02,  # Position the text slightly above the bar
                f'{int(p75_1)}', ha='center', va='bottom', color='#1A3E71', fontweight='bold', fontsize=16)

        # For Case 2 bars
        ax.text(bar2.get_x() + bar2.get_width()/2, p75_2 + 0.02,  # Position the text slightly above the bar
                f'{int(p75_2)}', ha='center', va='bottom', color='#2A7F3D', fontweight='bold', fontsize=16)

    for i, (bar3_lo, bar3_hi, lo, hi) in enumerate(zip(bars3_lo, bars3_hi, case3_lo, case3_hi)):
        ax.text(bar3_lo.get_x() + bar3_lo.get_width()/2, lo + 0.02,  # Position the text slightly above the bar
                f'{int(lo)}', ha='center', va='bottom', color='#8A4F00', fontweight='bold', fontsize=16)
        ax.text(bar3_hi.get_x() + bar3_hi.get_width()/2, hi if i in (0,) else hi * 1.2,  # Position the text slightly above the bar
                f'{int(hi)}', ha='center', va='bottom', color='#B26B00', fontweight='bold', fontsize=16)
        
    ax.set_ylabel('Time (s)', fontsize=18)
    ax.set_yscale('log')
    ax.set_ylim(1, 20000)
    ax.set_yticks([1, 10, 100, 1000, 10000])
    ax.set_yticklabels(ax.get_yticklabels(), fontsize=18)
    # ax.set_title('Normalized Group-wise Run Times with Variance')
    ax.set_xticks(index)
    ax.set_xticklabels(groups, fontsize=18)
    ax.legend(fontsize=18, loc='upper center', bbox_to_anchor=(0.5, 1.15), ncol=4, frameon=False)

    plt.tight_layout() 
    plt.subplots_adjust(top=0.92, bottom=0.10)
    # plt.show()
    plt.savefig('../scalability.pdf')

if __name__ == '__main__':
    cdns1 = process('coredns-simple.txt')
    cdns2 = process('coredns-complex.txt')
    bind1 = process('bind-simple.txt')
    bind2 = process('bind-complex.txt')
    pdns1 = process('pdns-simple.txt')
    pdns2 = process('pdns-complex.txt')
    hdns1 = process('hickory-simple.txt')
    hdns2 = process('hickory-complex.txt')

    plot(
        cdns1, cdns2, [187, 4520],
        bind1, bind2, [1623, 7498],
        pdns1, pdns2, [1590, 7201],
        hdns1, hdns2, [602, 1883],
    )