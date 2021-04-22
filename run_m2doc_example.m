% create options struct for m2doc
%% Options:
%   toolboxName - string : "Name_of_the_toolbox"
%       Distinct name that will be shown in the documentation
%   delOld - boolean: true
%       If documentation folder opts.outputFolder already exist, delete it 
%       first.
%   mFolder - string array : ["absolute_path_to_scripts"]
%       The folder specified in this variable (and subfolders) will be 
%       searched for .m and .mlx files to convert to html. Multiple folders
%       are possible. 
%   outputFolder - string array : ["absolute_path_to_output_folder"]
%       The folder specified in this variable will contain a subfolder with 
%       the converted html files, as well as the toc xml file. 
%   excludeFolder - string array : ["folder_names_to_exclude"]
%       If the path of an m file contains these words, they will be ignored
%       and not be converted to html.
%   excludeFile - string array : ["file_name_to_exclude"]
%       If the file name contains one of these words, they will be ignored
%       and not converted to html.
%   htmlFolderName - string: "name_of_output_html_folder"
%       Within the opts.outputFolder will be a subfolder which contains the
%       converted html files. This variable is the name of that folder.
%   htmlMetaFolder - string : ["relative_folder_name"]
%       This folder will contain the css-files and images of the html files
%       and will be a subfolder of opts.outputFolder.
%   htmlTemplate - string:  ["relative_folder_name"]
%       Define the folder containing the html template files that will
%       define the structure and look of the exported documents. The path
%       must be relative to m2docs template folder.
%   startpage - string array: ["name_of_landing_page_html_file_name"]
%       The very first toc-element will be displayed when opening the html
%       documentation, but is not a regular function/class m-file. Create
%       this landing page by manaully creating an m/mlx-file with this name
%       that contains the desired contents. It will be converted and used
%       accodingly.
%   toc - cell: 
%       The html documentation requires an xml file (helptoc.xml) that
%       structures the documentation. If this variable is empty, then the
%       original folder structure from opts.mFolder will be used.
%       Alternatively, a custom structure can be defined:
%       First cell column:  Names displayed in toc
%       Second cell column: Folder of origin
%       Third cell column:  cell that can define a substructure
%       Example: opts.toc = {"MyToolbox", "/", {}};
%           - All files from the root directory will be inside "MyToolbox"
%       opts.toc{1,3} = {"Vehicles", ["cars" "rockets"], {}};
%           - All files whose last folder is either "cars" or "rocket" will
%           be found under a new sub-toc element instead of the root dir:
%           Mytoolbox->Vehicles
%   verbose - boolean: false
%       If true, then more intermediate steps will be documented in the
%       command window.

opts = struct(  'toolboxName',      "m2doc", ...
                'delOld',           true, ...
                'mFolder',          ["C:\Users\pubbe\Documents\GitHub\m2doc"], ...
                'outputFolder',     ["C:\Users\pubbe\Documents\GitHub\m2doc\m2doc_documentation"], ...
                'excludeFolder',	["m2doc_documentation"], ...
                'excludeFile',      [""], ...
                'htmlFolderName',   "", ...
                'htmlMetaFolder',   "ressources", ...
                'htmlTemplate',     "m2doc-standard", ...
                'startPage',        ["Welcome_to_m2doc.html"], ...
                'toc',              [], ...
                'verbose',          false);
             

% make sure to have added m2doc to the matlab path
res = m2doc(opts);
doc
% if the building of the search database fails, run the script again!