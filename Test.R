library(readxl)
library(animint2)

path <- "/Users/tianyi.bruce.chen/Downloads/Test_Results.xlsx"

test_results <- read_excel(path)

accuracy_plot <- ggplot(test_results) +
  geom_point(clickSelects = 'Type',
             aes(x = Index,
                y = Accuracy, 
                color = Type)) +
  geom_tallrect(aes(xmin = Index - 0.5,
                    xmax = Index + 0.5)
                , alpha = 0.5
                , clickSelects = 'Index') 
  
  labs(x = 'Experiment Set Index')

recall_plot <- ggplot(test_results) +
  geom_point(clickSelets = 'Type',
             aes(x = Index,
                 y = `Recall(COVID-19)`,
                 color = Type)) +
  geom_point(showSelected = 'Index',
             aes(x = Index,
                 y = `Recall(COVID-19)`))

precision_plot <- ggplot(test_results) +
  geom_point(clickSelets = 'Type',
             aes(x = Index,
                 y = `Precision(COVID-19)`,
                 color = Type)) +
  geom_point(showSelected = 'Index',
             aes(x = Index,
                 y = `Precision(COVID-19)`))

f1_plot <- ggplot(test_results) +
  geom_point(clickSelets = 'Type',
             aes(x = Index,
                 y = `F1 score(COVID-19)`,
                 color = Type)) +
  geom_point(showSelected = 'Index',
             aes(x = Index,
                 y = `F1 score(COVID-19)`))



animint(accuracy_plot, 
        recall_plot,
        precision_plot,
        f1_plot,
        source = "https://github.com/TyBruceChen/Viz-animint2-research-covid-19-chest-xrays-Code",
        title = "Viz of research: A Vision Transformer Machine Learning Model for COVID-19 Dagnosis Using Chest X-Ray Images")
