/**********************************************************************
 *  about.h
 **********************************************************************
 * Copyright (C) 2025 WHO-AM-I-404
 *
 * This file is part of Linux Cleaner.
 *
 * This is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this package. If not, see <http://www.gnu.org/licenses/>.
 **********************************************************************/
#pragma once

class QString;

void displayDoc(const QString &url, const QString &title);
void displayAboutMsgBox(const QString &title, const QString &message, const QString &licence_url,
                        const QString &license_title);
