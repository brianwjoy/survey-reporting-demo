# Survey Reporting Demo

*Disclaimer: All survey questions and data contained in this project are entirely fictitious and have been generated solely for demonstration purposes.*

## Purpose

The purpose of this project is to provide a general introduction to a scaleable and reproducible survey reporting workflow using R and Quarto.

**This project is not intended to:**

-   Showcase definitive best practices in survey reporting
-   Exhaustively demonstrate all functionality of packages used
-   Be a copy/paste solution for your reporting needs

## Project Structure

-   \_00_utility_functions.r

    -   contains a single utility function to assist in cleaning up variable labels; especially useful for matrix table style questions

-   \_01_clean_data.r

    -   Reads in an SPSS .sav data file, creates meaningful var names, adjusts variables types, and saves cleaned data as RDS file

-   \_02_overall_report.qmd

    -   Quarto markdown file that uses the [gtsummary](https://www.danieldsjoberg.com/gtsummary/) and [kableExtra](https://haozhu233.github.io/kableExtra/) packages to create and format summary tables for use with $LaTeX$ and PDF output reports

-   \_03_execute_overall_report.r

    -   Simple R script to render the .qmd file with more control over output location

-   \_04_college_report.qmd

    -   Introduces the concept of report parameters and demonstrates Table of Contents functionality in Quarto

-   \_05_execute_college_reports.r

    -   Builds list of colleges for reporting, creates function to be supplied with college codes, uses [purrr](https://purrr.tidyverse.org/) to iterate through function for all colleges in your list

## Additional Resources

-   [Tips for Custom Parameterized PDFs in Quarto](https://meghan.rbind.io/blog/2022-09-25-tips-for-custom-parameterized-pdfs-in-quarto/)
-   [Create Awesome LaTeX Table with knitr::kable and kableExtra](https://haozhu233.github.io/kableExtra/awesome_table_in_pdf.pdf)
