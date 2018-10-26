# Docker-helper-scripts
A set of shell scripts enabling faster operations with Docker.

## Setup

Copy scripts, including .awk scripts to a directory in your path. Don't forget
to check if scripts have execution bit set.

The following scripts are available: **dkl**, **dkll**, **dka**, **dks**,
**dkk**, **dkrm**, **dki**, **dkrmi**.

## Scripts quick reference
- **dkl [-a|-e [exit_code]]**

  | ```$ dkl```  | List running Docker containers.  |
  | -- | -- |
  | ```$ dkl -a```  | List all Docker containers.  |
  | ```$ dkl -e [exit_code]```  | List all exited Docker containers [with specific exit code].  |

- **dkll [-f] [id/name ...]**

  | ```$ dkll```  | Display Docker log file of last active Docker container.  |
  | -- | -- |
  | ```$ dkll -f```  | Follow (tail -f) Docker log file of last active Docker container.  |
  | ```$ dkll 029ecdbc49fd```<br>```$ dkll kind_einstein```  | Display Docker log file of container specified with id or name.  |

- **dka [id/name ...]**  
  dka is a shell helper function for attaching to Docker container.
  It needs to be defined in your shell rc file - copy function ```dka() {...}```
  from supplied *bashrc* to your *.bashrc* and reload shell.

  | ```$ dka```  | Attach to last active Docker container. Container is started before attaching.  |
  | -- | -- |
  | ```$ dka 029ecdbc49fd```<br>```$ dka kind_einstein```  | Attach to Docker container specified with id or name. Container is started before attaching.  |

- **dks [-a] [id/name ...]**

  | ```$ dks 029ecdbc49fd```<br>```$ dks kind_einstein```  | Stop Docker container specified with id or name.  |
  | -- | -- |
  | ```$ dks -a```  | Stop all Docker containers.  |

- **dkk [-a] [id/name ...]**

  | ```$ dkk 029ecdbc49fd```<br>```$ dkk kind_einstein```  | Kill Docker container specified with id or name.  |
  | -- | -- |
  | ```$ dkk -a```  | Kill all Docker containers.  |

- **dkrm [-a] [id/name ...]**

  | ```$ dkrm 029ecdbc49fd```<br>```$ dkrm kind_einstein```  | Remove container specified with id or name.  |
  | -- | -- |
  | ```$ dkrm -a```  | Remove all Docker containers (**CAREFUL!!**).  |

- **dki [-a|-d]**

  | ```$ dki```  | List Docker images.  |
  | -- | -- |
  | ```$ dki -a```  | List all Docker images.  |
  | ```$ dki -d```  | List all dangling Docker images.  |

- **dkrmi [-a] [id/name ...]**

  | ```$ dkrmi 77582d6037d7```<br>```$ dkrmi openjdk```  | Remove Docker image with id or name.  |
  | -- | -- |
  | ```$ dkrmi -a```  | Remove all Docker images (**CAREFUL!!**).  |
