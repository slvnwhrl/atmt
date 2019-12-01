import matplotlib.pyplot as plt


# beam size
bleu_scores = [10.7, 12.1, 12.7, 13.4, 13.8, 13.8, 14.2, 14.1, \
               14.3, 14.3, 14.5, 14.6, 14.8, 15, 15.1, 15.2, 15.2, \
               15.3, 15.4, 15.4, 15.5, 15.7, 15.8, 15.8, 15.8]
num_scores = len(bleu_scores)

plt.plot([i for i in range(1, len(bleu_scores)+1)], bleu_scores)
plt.locator_params(axis='x', nbins=num_scores*2)
plt.title('BLEU score for various beam sizes')
plt.xlabel('beam size')
plt.ylabel('BLEU score')
plt.show()

# length normalization
bleu_scores = [14.2, 14.2, 14.1, 14.2, 14.2, 14.1, 14.0, 13.9, 13.7, 13.6, 13.5]
hyp_len = [4642, 4654, 4677, 4703, 4722, 4756, 4796, 4855, 4905, 4952, 5012]
rep_len = 4017
fig, ax1 = plt.subplots()
xticks = [i/10 for i in range(0, 11, 1)]
ax1.locator_params(axis='x', nbins=len(xticks))
ax1.set_title('BLEU score for various alpha values and a beam size of 7')
ax2 = ax1.twinx()
ax1.plot(xticks, bleu_scores, 'g')
ax2.plot(xticks, hyp_len, 'tab:blue')
#ax2.axhline(y=rep_len, c='r')
ax1.set_xlabel('alpha')
ax1.set_ylabel('BLEU score', color='g')
ax2.set_ylabel('hyp len', color='tab:blue')

plt.show()



